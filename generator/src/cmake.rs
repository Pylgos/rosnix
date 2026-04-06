use std::{collections::HashMap, ops::Range};

use reqwest::Url;
use tracing::warn;

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct CMakeCall {
    pub func: String,
    pub args: Vec<CMakeToken>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct CMakeToken {
    pub range: Range<usize>,
    pub kind: CMakeTokenKind,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum CMakeTokenKind {
    Ident(String),
    Literal(String),
    ParLe,
    ParRi,
}

#[derive(Debug, Clone)]
enum CMakeStmt {
    Call(CMakeCall),
    If { branches: Vec<CMakeIfBranch> },
}

#[derive(Debug, Clone)]
struct CMakeIfBranch {
    cond: Option<Vec<CMakeToken>>,
    body: Vec<CMakeStmt>,
}

fn is_ident_char(c: char) -> bool {
    !matches!(c, ' ' | '\t' | '\n' | '\r' | '(' | ')' | '"' | '#')
}

fn cmake_tokenize(src: &str) -> Vec<CMakeToken> {
    let mut tokens = Vec::new();
    let mut chars = src.char_indices().peekable();

    while let Some((i, c)) = chars.next() {
        match c {
            ' ' | '\t' | '\n' | '\r' => {}
            '(' => tokens.push(CMakeToken {
                range: i..i + 1,
                kind: CMakeTokenKind::ParLe,
            }),
            ')' => tokens.push(CMakeToken {
                range: i..i + 1,
                kind: CMakeTokenKind::ParRi,
            }),
            '"' => {
                let start = i;
                let mut s = String::new();
                let mut end = i + 1;
                let mut terminated = false;
                while let Some((j, ch)) = chars.next() {
                    end = j + ch.len_utf8();
                    match ch {
                        '"' => {
                            terminated = true;
                            break;
                        }
                        '\\' => {
                            if let Some((_, esc)) = chars.next() {
                                match esc {
                                    'n' => s.push('\n'),
                                    'r' => s.push('\r'),
                                    't' => s.push('\t'),
                                    '\\' => s.push('\\'),
                                    '"' => s.push('"'),
                                    other => {
                                        s.push('\\');
                                        s.push(other);
                                    }
                                }
                            } else {
                                break;
                            }
                        }
                        other => s.push(other),
                    }
                }
                if !terminated {
                    end = src.len();
                }
                tokens.push(CMakeToken {
                    range: start..end,
                    kind: CMakeTokenKind::Literal(s),
                });
            }
            '#' => {
                while let Some((_, ch)) = chars.peek().copied() {
                    chars.next();
                    if ch == '\n' {
                        break;
                    }
                }
            }
            _ => {
                let start = i;
                let mut end = i + c.len_utf8();
                while let Some((j, ch)) = chars.peek().copied() {
                    if !is_ident_char(ch) {
                        break;
                    }
                    chars.next();
                    end = j + ch.len_utf8();
                }
                tokens.push(CMakeToken {
                    range: start..end,
                    kind: CMakeTokenKind::Ident(src[start..end].to_string()),
                });
            }
        }
    }

    tokens
}

fn parse_call(tokens: &[CMakeToken], cur: &mut usize) -> Option<CMakeCall> {
    let start_cur = *cur;
    let token = tokens.get(*cur)?;
    let CMakeTokenKind::Ident(func) = &token.kind else {
        *cur += 1;
        return None;
    };
    let Some(next) = tokens.get(*cur + 1) else {
        *cur += 1;
        return None;
    };
    if next.kind != CMakeTokenKind::ParLe {
        *cur += 1;
        return None;
    }

    *cur += 2;
    let mut depth = 1usize;
    let mut args = Vec::new();

    while let Some(tok) = tokens.get(*cur) {
        match tok.kind {
            CMakeTokenKind::ParLe => {
                depth += 1;
                args.push(tok.clone());
                *cur += 1;
            }
            CMakeTokenKind::ParRi => {
                depth -= 1;
                *cur += 1;
                if depth == 0 {
                    break;
                }
                args.push(tok.clone());
            }
            _ => {
                args.push(tok.clone());
                *cur += 1;
            }
        }
    }

    if depth > 0 {
        *cur = start_cur + 1;
        return None;
    }

    Some(CMakeCall {
        func: func.clone(),
        args,
    })
}

fn parse_stmts(tokens: &[CMakeToken], cur: &mut usize, stop: &[&str]) -> (Vec<CMakeStmt>, Option<CMakeCall>) {
    let mut stmts = Vec::new();

    while *cur < tokens.len() {
        let checkpoint = *cur;
        let Some(call) = parse_call(tokens, cur) else {
            if *cur == checkpoint {
                *cur += 1;
            }
            continue;
        };

        let func = call.func.to_ascii_lowercase();
        if stop.iter().any(|s| *s == func) {
            return (stmts, Some(call));
        }

        if func == "if" {
            stmts.push(CMakeStmt::If {
                branches: parse_if(tokens, cur, call),
            });
        } else {
            stmts.push(CMakeStmt::Call(call));
        }
    }

    (stmts, None)
}

fn parse_if(tokens: &[CMakeToken], cur: &mut usize, if_call: CMakeCall) -> Vec<CMakeIfBranch> {
    let mut branches = Vec::new();
    let mut pending_cond = Some(if_call.args);

    loop {
        let (body, term) = parse_stmts(tokens, cur, &["elseif", "else", "endif"]);
        branches.push(CMakeIfBranch {
            cond: pending_cond.take(),
            body,
        });

        let Some(term) = term else {
            break;
        };
        match term.func.to_ascii_lowercase().as_str() {
            "elseif" => {
                pending_cond = Some(term.args);
            }
            "else" => {
                let (else_body, _endif) = parse_stmts(tokens, cur, &["endif"]);
                branches.push(CMakeIfBranch {
                    cond: None,
                    body: else_body,
                });
                break;
            }
            "endif" => break,
            _ => break,
        }
    }

    branches
}

fn flatten_all(stmts: &[CMakeStmt], out: &mut Vec<CMakeCall>) {
    for stmt in stmts {
        match stmt {
            CMakeStmt::Call(call) => out.push(call.clone()),
            CMakeStmt::If { branches } => {
                for branch in branches {
                    flatten_all(&branch.body, out);
                }
            }
        }
    }
}

fn cmake_false_literal(s: &str) -> bool {
    let upper = s.to_ascii_uppercase();
    upper.is_empty()
        || upper == "0"
        || upper == "FALSE"
        || upper == "OFF"
        || upper == "NO"
        || upper == "N"
        || upper == "IGNORE"
        || upper == "NOTFOUND"
        || upper.ends_with("-NOTFOUND")
}

fn cmake_true_literal(s: &str) -> bool {
    !cmake_false_literal(s)
}

fn cmake_resolve_var(vars: &HashMap<String, String>, arg: &CMakeToken) -> Option<String> {
    use CMakeTokenKind::*;
    let arg = match &arg.kind {
        Ident(s) => s,
        Literal(s) => s,
        _ => return None,
    };

    let mut chars = arg.chars().peekable();
    let mut result = String::new();

    loop {
        let Some(cur) = chars.next() else {
            break;
        };
        let maybe_next = chars.peek();

        match (cur, maybe_next) {
            ('$', Some('{')) => {
                chars.next(); // skip '{'
                let mut var = String::new();
                for c in chars.by_ref() {
                    if c == '}' {
                        if let Some(v) = vars.get(&var) {
                            result.push_str(v);
                        }
                        break;
                    }
                    var.push(c);
                }
            }
            _ => {
                result.push(cur);
            }
        }
    }

    Some(result)
}

fn cond_tokens(tokens: &[CMakeToken], vars: &HashMap<String, String>) -> Vec<String> {
    let mut out = Vec::new();
    for t in tokens {
        match &t.kind {
            CMakeTokenKind::ParLe => out.push("(".to_string()),
            CMakeTokenKind::ParRi => out.push(")".to_string()),
            _ => {
                if let Some(v) = cmake_resolve_var(vars, t) {
                    out.push(v);
                }
            }
        }
    }
    out
}

fn parse_condition_primary(tokens: &[String], cur: &mut usize, vars: &HashMap<String, String>) -> Option<bool> {
    let token = tokens.get(*cur)?;
    if token == "(" {
        *cur += 1;
        let v = parse_condition_or(tokens, cur, vars)?;
        if tokens.get(*cur).map(|s| s.as_str()) == Some(")") {
            *cur += 1;
            return Some(v);
        }
        return None;
    }

    let upper = token.to_ascii_uppercase();
    if upper == "DEFINED" {
        let key = tokens.get(*cur + 1)?;
        *cur += 2;
        return Some(vars.contains_key(key));
    }

    let lhs = vars.get(token).cloned().unwrap_or_else(|| token.clone());
    *cur += 1;

    let Some(op) = tokens.get(*cur) else {
        return Some(cmake_true_literal(&lhs));
    };
    let op_upper = op.to_ascii_uppercase();

    if ["STREQUAL", "EQUAL", "LESS", "GREATER", "LESS_EQUAL", "GREATER_EQUAL"].contains(&op_upper.as_str()) {
        let rhs_raw = tokens.get(*cur + 1)?;
        let rhs = vars.get(rhs_raw).cloned().unwrap_or_else(|| rhs_raw.clone());
        *cur += 2;
        let num_cmp = lhs
            .parse::<f64>()
            .ok()
            .zip(rhs.parse::<f64>().ok());
        let v = match op_upper.as_str() {
            "STREQUAL" => lhs == rhs,
            "EQUAL" => {
                if let Some((a, b)) = num_cmp {
                    a == b
                } else {
                    lhs == rhs
                }
            }
            "LESS" => num_cmp.map_or_else(|| lhs < rhs, |(a, b)| a < b),
            "GREATER" => num_cmp.map_or_else(|| lhs > rhs, |(a, b)| a > b),
            "LESS_EQUAL" => num_cmp.map_or_else(|| lhs <= rhs, |(a, b)| a <= b),
            "GREATER_EQUAL" => num_cmp.map_or_else(|| lhs >= rhs, |(a, b)| a >= b),
            _ => false,
        };
        return Some(v);
    }

    Some(cmake_true_literal(&lhs))
}

fn parse_condition_not(tokens: &[String], cur: &mut usize, vars: &HashMap<String, String>) -> Option<bool> {
    let token = tokens.get(*cur)?;
    if token.eq_ignore_ascii_case("NOT") {
        *cur += 1;
        return parse_condition_not(tokens, cur, vars).map(|v| !v);
    }
    parse_condition_primary(tokens, cur, vars)
}

fn parse_condition_and(tokens: &[String], cur: &mut usize, vars: &HashMap<String, String>) -> Option<bool> {
    let mut lhs = parse_condition_not(tokens, cur, vars)?;
    while tokens
        .get(*cur)
        .map(|s| s.eq_ignore_ascii_case("AND"))
        .unwrap_or(false)
    {
        *cur += 1;
        let rhs = parse_condition_not(tokens, cur, vars)?;
        lhs = lhs && rhs;
    }
    Some(lhs)
}

fn parse_condition_or(tokens: &[String], cur: &mut usize, vars: &HashMap<String, String>) -> Option<bool> {
    let mut lhs = parse_condition_and(tokens, cur, vars)?;
    while tokens
        .get(*cur)
        .map(|s| s.eq_ignore_ascii_case("OR"))
        .unwrap_or(false)
    {
        *cur += 1;
        let rhs = parse_condition_and(tokens, cur, vars)?;
        lhs = lhs || rhs;
    }
    Some(lhs)
}

fn eval_if_condition(tokens: &[CMakeToken], vars: &HashMap<String, String>) -> Option<bool> {
    let flat = cond_tokens(tokens, vars);
    if flat.is_empty() {
        return Some(false);
    }
    let mut cur = 0usize;
    let result = parse_condition_or(&flat, &mut cur, vars)?;
    if cur == flat.len() {
        Some(result)
    } else {
        None
    }
}

fn apply_set_call(call: &CMakeCall, vars: &mut HashMap<String, String>) {
    if !call.func.eq_ignore_ascii_case("set") {
        return;
    }
    let args = CMakeArgs::parse(&call.args, vars);
    if let (Some(key), Some(value)) = (args.get(0), args.get(1)) {
        vars.insert(key.to_string(), value.to_string());
    }
}

fn flatten_active(stmts: &[CMakeStmt], out: &mut Vec<CMakeCall>, vars: &mut HashMap<String, String>) {
    for stmt in stmts {
        match stmt {
            CMakeStmt::Call(call) => {
                out.push(call.clone());
                apply_set_call(call, vars);
            }
            CMakeStmt::If { branches } => {
                let mut chosen: Option<usize> = None;
                let mut unknown_at: Option<usize> = None;
                for (idx, branch) in branches.iter().enumerate() {
                    match &branch.cond {
                        Some(cond) => match eval_if_condition(cond, vars) {
                            Some(true) => {
                                if unknown_at.is_none() {
                                    chosen = Some(idx);
                                }
                                break;
                            }
                            Some(false) => {}
                            None => {
                                if unknown_at.is_none() {
                                    unknown_at = Some(idx);
                                }
                            }
                        },
                        None => {
                            if unknown_at.is_none() {
                                chosen = Some(idx);
                            }
                            break;
                        }
                    }
                }

                if let Some(idx) = chosen {
                    flatten_active(&branches[idx].body, out, vars);
                } else if let Some(start) = unknown_at {
                    for branch in &branches[start..] {
                        let mut branch_vars = vars.clone();
                        flatten_active(&branch.body, out, &mut branch_vars);
                    }
                }
            }
        }
    }
}

pub fn cmake_find_calls(src: &str) -> Vec<CMakeCall> {
    let tokens = cmake_tokenize(src);
    let mut cur = 0usize;
    let (stmts, _) = parse_stmts(&tokens, &mut cur, &[]);
    let mut calls = Vec::new();
    flatten_all(&stmts, &mut calls);
    calls
}

pub fn cmake_find_active_calls(src: &str) -> Vec<CMakeCall> {
    let tokens = cmake_tokenize(src);
    let mut cur = 0usize;
    let (stmts, _) = parse_stmts(&tokens, &mut cur, &[]);
    let mut calls = Vec::new();
    let mut vars = HashMap::new();
    flatten_active(&stmts, &mut calls, &mut vars);
    calls
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct CMakeArgs {
    pub args: Vec<String>,
    pub ranges: Vec<Range<usize>>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct CMakeKeywordArg {
    pub value: String,
    pub range: Range<usize>,
}

impl CMakeArgs {
    pub fn parse(tokens: &[CMakeToken], vars: &HashMap<String, String>) -> Self {
        let mut result = CMakeArgs {
            args: Vec::new(),
            ranges: Vec::new(),
        };
        for token in tokens {
            if let Some(arg) = cmake_resolve_var(vars, token) {
                result.args.push(arg);
                result.ranges.push(token.range.clone());
            }
        }
        result
    }

    pub fn find_keyword_arg(&self, keyword: &str) -> Option<CMakeKeywordArg> {
        let mut args = self.args.iter().zip(self.ranges.iter());
        while let Some((arg, range)) = args.next() {
            if arg == keyword {
                if let Some((next_arg, next_range)) = args.clone().next() {
                    return Some(CMakeKeywordArg {
                        value: next_arg.clone(),
                        range: range.start..next_range.end,
                    });
                }
            }
        }
        None
    }

    pub fn find_keyword_arg_expect_url(&self, keyword: &str) -> Option<CMakeKeywordArg> {
        let arg = self.find_keyword_arg(keyword);
        if let Some(arg) = arg {
            match Url::parse(&arg.value) {
                Ok(_) => Some(arg),
                Err(err) => {
                    warn!("failed to parse url: {}", err);
                    None
                }
            }
        } else {
            None
        }
    }

    pub fn get(&self, index: usize) -> Option<&str> {
        self.args.get(index).map(|s| s.as_str())
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_cmake_find_active_calls_with_if_else() {
        let src = r#"
set(BRANCH stable)
if(BRANCH STREQUAL stable)
  set(LIB_VCS_VER v1)
else()
  set(LIB_VCS_VER main)
endif()
ament_vendor(pkg VCS_VERSION ${LIB_VCS_VER})
"#;
        let calls = cmake_find_active_calls(src);

        let mut vars = HashMap::new();
        let mut vcs_version = None;
        for call in calls {
            let func = call.func.to_ascii_lowercase();
            let args = CMakeArgs::parse(&call.args, &vars);
            if func == "set" {
                if let (Some(k), Some(v)) = (args.get(0), args.get(1)) {
                    vars.insert(k.to_string(), v.to_string());
                }
            }
            if func == "ament_vendor" {
                vcs_version = args.find_keyword_arg("VCS_VERSION").map(|x| x.value);
            }
        }

        assert_eq!(vcs_version.as_deref(), Some("v1"));
    }

    #[test]
    fn test_cmake_find_calls_tolerates_unclosed_constructs() {
        let src = "if(FOO)\nset(URL https://example.com)\nExternalProject_Add(name URL \"https://x\"";
        let calls = cmake_find_calls(src);
        assert!(calls.iter().any(|c| c.func.eq_ignore_ascii_case("set")));
    }
}
