{
  cargo,
  mkShell,
  nix-prefetch-git,
  nurl,
  openssl,
  pkg-config,
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
    rust-analyzer
    rustc
    rustfmt
  ];
  buildInputs = [
    openssl
  ];
}
