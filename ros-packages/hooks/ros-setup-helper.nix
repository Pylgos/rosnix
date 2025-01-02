{ rustPlatform }:

rustPlatform.buildRustPackage {
  pname = "rosnix-setup-helper";
  version = "0.1.0";
  src = ./setup-helper;
  cargoLock.lockFile = ./setup-helper/Cargo.lock;
}
