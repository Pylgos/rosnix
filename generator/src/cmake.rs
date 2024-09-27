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

fn cmake_tokenize(src: &str) -> Vec<CMakeToken> {
    let mut tokens = Vec::new();
    let mut chars = src.char_indices();
    loop {
        let Some((i, c)) = chars.next() else {
            break;
        };
        match c {
            ' ' | '\t' | '\n' => {}
            '(' => {
                tokens.push(CMakeToken {
                    range: i..i + 1,
                    kind: CMakeTokenKind::ParLe,
                });
            }
            ')' => {
                tokens.push(CMakeToken {
                    range: i..i + 1,
                    kind: CMakeTokenKind::ParRi,
                });
            }
            '"' => {
                let start = i;
                let mut s = String::new();
                while let Some((i, c)) = chars.next() {
                    match c {
                        '"' => {
                            tokens.push(CMakeToken {
                                range: start..i + 1,
                                kind: CMakeTokenKind::Literal(s),
                            });
                            break;
                        }
                        '\\' => {
                            if let Some((_, c)) = chars.next() {
                                match c {
                                    'n' => s.push('\n'),
                                    'r' => s.push('\r'),
                                    't' => s.push('\t'),
                                    '\\' => s.push('\\'),
                                    '"' => s.push('"'),
                                    _ => {}
                                }
                            }
                        }
                        _ => {
                            s.push(c);
                        }
                    }
                }
            }
            '#' => {
                for (_, c) in chars.by_ref() {
                    if c == '\n' {
                        break;
                    }
                }
            }
            _ => {
                let start = i;
                while let Some((i, c)) = chars.clone().next() {
                    match c {
                        ' ' | '\t' | '\n' | '(' | ')' | '"' | '#' => {
                            tokens.push(CMakeToken {
                                range: start..i,
                                kind: CMakeTokenKind::Ident(src[start..i].to_string()),
                            });
                            break;
                        }
                        _ => {
                            chars.next();
                        }
                    }
                }
            }
        }
    }
    tokens
}

pub fn cmake_find_calls(src: &str) -> Vec<CMakeCall> {
    let mut calls = Vec::new();
    let tokens = cmake_tokenize(src);
    let mut tokens_iter = tokens.iter().peekable();

    loop {
        use CMakeTokenKind::*;

        let Some(token) = tokens_iter.next() else {
            break;
        };

        if let Ident(func) = &token.kind {
            let Some(next) = tokens_iter.peek().copied() else {
                break;
            };
            if next.kind != ParLe {
                continue;
            }
            tokens_iter.next(); // skip '('
            let mut args = Vec::new();
            for token in tokens_iter.by_ref() {
                match &token.kind {
                    ParRi => {
                        break;
                    }
                    _ => {
                        args.push(token.clone());
                    }
                }
            }
            calls.push(CMakeCall {
                func: func.clone(),
                args,
            });
        }
    }

    calls
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
