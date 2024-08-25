{
  makeSetupHook,
  bash,
  writeScript,
  rustPlatform,
}:
let
  helper = rustPlatform.buildRustPackage {
    pname = "rosnix-setup-helper";
    version = "0.1.0";
    src = ./setup-helper;
    cargoLock.lockFile = ./setup-helper/Cargo.lock;
  };
in
makeSetupHook
  {
    name = "rosnix-setup-hook";
    substitutions = {
      shell = "${bash}/bin/bash";
      setupHelper = "${helper}/bin/setup-helper";
    };
  }
  (
    writeScript "rosnix-setup-hook.sh" ''
      #!@shell@

      _rosnixSetupHook_addSearchPath() {
        addToSearchPath _ROSNIX_SEARCH_PATH "$1"
      }

      _rosnixSetupHook_postHook() {
        local fake_complete
        if ! type complete > /dev/null 2>&1; then
          complete() {
            :
          }
          fake_complete=1
        fi
        source <(@setupHelper@)
        if [ -n "$fake_complete" ]; then
          unset -f complete
        fi
      }

      addEnvHooks "$targetOffset" _rosnixSetupHook_addSearchPath
      addEnvHooks "$hostOffset" _rosnixSetupHook_addSearchPath

      postHooks+=(_rosnixSetupHook_postHook)
    ''
  )
