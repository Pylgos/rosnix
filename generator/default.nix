{
  craneLib,
  lib,
  makeWrapper,
  nix,
  nix-prefetch-git,
  openssl,
  pkg-config,
  filter,
}:
let

  commonArgs = {
    pname = "rosnix-generator";
    version = "0.1.0";
    src = filter {
      root = ./.;
      include = [
        "Cargo.toml"
        "Cargo.lock"
        "build.rs"
        "src"
      ];
    };
    nativeBuildInputs = [
      pkg-config
      makeWrapper
    ];
    buildInputs = [ openssl ];
    doCheck = false;
  };
in
craneLib.buildPackage (
  commonArgs
  // {
    cargoArtifacts = craneLib.buildDepsOnly commonArgs;
    postInstall = ''
      wrapProgram "$out/bin/rosnix-generator" --prefix PATH : ${
        lib.makeBinPath [
          nix
          nix-prefetch-git
        ]
      }
    '';
  }
)
