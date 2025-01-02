{
  runCommand,
  rosSetupHook,
  rosSetupHelper,
  runtimeShell,
}:

{
  name,
  bin,
  nativeBuiltInputs ? [ ],
  ...
}@args:

runCommand name
  (
    builtins.removeAttrs args [
      "name"
    ]
    // {
      nativeBuildInputs = [ rosSetupHook ] ++ nativeBuiltInputs;
    }
  )
  ''
    mkdir -p "$out/bin"
    dst="$out/bin/$(basename "$bin")"
    {
      echo '#!${runtimeShell}'
      echo "export PYTHONPATH=$PYTHONPATH"
      echo "export _ROSNIX_SEARCH_PATH='$_ROSNIX_SEARCH_PATH'"
      echo 'source <(${rosSetupHelper}/bin/setup-helper)'
      echo "exec '$bin' "'"$@"'

    } > "$dst"
    chmod +x "$dst"
  ''
