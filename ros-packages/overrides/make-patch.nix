{
  lib,
  diffutils,
  runCommand,
}:

name: a: b:
runCommand name { } ''
  ${diffutils}/bin/diff --unidirectional-new-file -ur ${
    lib.escapeShellArgs [
      a
      b
    ]
  } | grep -v '^Only in ${a}' > "$out" || true
  substituteInPlace "$out" \
    --replace-quiet ${lib.escapeShellArg a} a \
    --replace-quiet ${lib.escapeShellArg b} b
''
