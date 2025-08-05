use std::collections::BTreeMap;

use anyhow::{anyhow, bail, ensure, Context as _, Result};
use lalrpop_util::lalrpop_mod;

lalrpop_mod!(condition);

pub fn eval_condition(input: &str, env: &BTreeMap<String, String>) -> Result<bool> {
    let parser = condition::ConditionParser::new();
    parser
        .parse(env, input)
        .map_err(|e| anyhow!(e.to_string()))
        .context(format!("failed to evaluate condition: {input:?}"))
}

fn unquote(s: &str) -> Result<String> {
    ensure!(s.len() >= 2, "string too short");
    let mut chars = s.chars();
    let quote = chars.next().unwrap();
    ensure!(s.chars().last().unwrap() == quote, "unmatched quote");
    let mut result = String::new();
    loop {
        let c = chars.next();
        match c {
            Some('\\') => match chars.next() {
                Some('n') => result.push('\n'),
                Some('r') => result.push('\r'),
                Some('t') => result.push('\t'),
                Some('\\') => result.push('\\'),
                Some('"') => result.push('"'),
                Some(c) => bail!("invalid escape character: {}", c),
                None => bail!("unterminated escape sequence"),
            },
            Some(c) if c == quote => {
                ensure!(
                    chars.next().is_none(),
                    "extra characters after closing quote"
                );
            }
            Some(c) => result.push(c),
            None => break,
        }
    }
    Ok(result)
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_unquote() {
        assert_eq!(unquote(r#""hello""#).unwrap(), "hello");
        assert_eq!(unquote(r#""hello\nworld""#).unwrap(), "hello\nworld");
        assert_eq!(unquote(r#""hello\tworld""#).unwrap(), "hello\tworld");
        assert_eq!(unquote(r#""hello\"world""#).unwrap(), "hello\"world");
        assert!(unquote(r#""unterminated"#).is_err());
        assert!(unquote(r#""invalid\c"#).is_err());
    }

    #[test]
    fn test_eval_condition() {
        let mut env = BTreeMap::new();
        env.insert("CONDA_PREFIX".to_string(), "".to_string());
        env.insert("HOMEBREW_PREFIX".to_string(), "".to_string());

        assert!(
            eval_condition("($CONDA_PREFIX == '') and ($HOMEBREW_PREFIX == '')", &env).unwrap()
        );
    }
}
