{
  cargo,
  mkShell,
  nix-prefetch-git,
  nurl,
  openssl,
  pkg-config,
  poetry,
  rust-analyzer,
  rustc,
  rustfmt,
}:
mkShell {
  nativeBuildInputs = [
    cargo
    nix-prefetch-git
    nurl
    pkg-config
    poetry
    rust-analyzer
    rustc
    rustfmt
  ];
  buildInputs = [
    openssl
  ];
}
