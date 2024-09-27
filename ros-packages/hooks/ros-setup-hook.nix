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
makeSetupHook {
  name = "ros-setup-hook";
  substitutions = {
    setupHelper = "${helper}/bin/setup-helper";
  };
} ./ros-setup-hook.sh
