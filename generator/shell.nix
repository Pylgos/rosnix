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
  yarn-berry_3,
  uv,
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
    uv
    yarn-berry_3.yarn-berry-fetcher

  ];
  buildInputs = [
    openssl
  ];
}
