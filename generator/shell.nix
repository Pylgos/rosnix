{
  mkShell,
  cargo,
  rustfmt,
  rust-analyzer,
  rustc,
  nix-prefetch-git,
  openssl,
  pkg-config,
}:
mkShell {
  nativeBuildInputs = [
    pkg-config
    nix-prefetch-git
    cargo
    rustfmt
    rust-analyzer
    rustc
  ];
  buildInputs = [
    openssl
  ];
}
