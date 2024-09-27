{
  mkShell,
  nix-prefetch-git,
  openssl,
  pkg-config,
}:
mkShell {
  buildInputs = [
    nix-prefetch-git
    openssl
    pkg-config
  ];
}
