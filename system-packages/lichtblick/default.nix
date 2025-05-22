{
  lib,
  stdenv,
  fetchFromGitHub,
  nodejs,
  yarn-berry_3,
  electron,
  makeWrapper,
}:
let
  yarn-berry = yarn-berry_3;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "lichtblick";
  version = "1.13.0";
  src = fetchFromGitHub {
    owner = "lichtblick-suite";
    repo = "lichtblick";
    rev = "v${finalAttrs.version}";
    hash = "sha256-CdK25ShmZt18to4ZxGJ3b4mIQTgDhPJO6+DPa3rBllA=";
  };

  nativeBuildInputs = [
    nodejs
    yarn-berry
    yarn-berry.yarnBerryConfigHook
    makeWrapper
  ];

  offlineCache = yarn-berry.fetchYarnBerryDeps {
    inherit (finalAttrs) src missingHashes;
    hash = "sha256-rxGKRzzCDaZuAJwOStDzdZDLxg++/aAUXwaoYemKx7Y=";
  };

  missingHashes = ./missing-hashes.json;

  makeCacheWritable = true;

  postPatch = ''
    # Disable corepack
    substituteInPlace "package.json" --replace-fail '"packageManager": "yarn@3.6.3",' ""
    substituteInPlace .yarnrc.yml --replace-fail 'yarnPath: .yarn/yarn-wrapper.js' ""

    # Patch electron-builder config
    substituteInPlace packages/suite-desktop/src/electronBuilderConfig.js --replace-fail \
      'electronVersion,' \
      'electronVersion: "${electron.version}", electronDist: "${electron.dist}",'
    substituteInPlace packages/suite-desktop/src/electronBuilderConfig.js --replace-fail \
          'target: [
            {
              target: "deb",
              arch: ["x64", "arm64"],
            },
            {
              target: "tar.gz",
              arch: ["x64", "arm64"],
            },
          ],' \
      'target: [{target: "dir", arch: ["x64"]}],'
  '';

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
    NODE_OPTIONS = "--max_old_space_size=6144";
  };

  buildPhase = ''
    yarn run desktop:build:prod
    yarn run package:linux
  '';

  installPhase = ''
    mkdir -p $out/share/lichtblick
    pushd dist/linux-unpacked
    cp -r locales resources{,.pak} $out/share/lichtblick
    popd
    makeWrapper ${lib.getExe electron} $out/bin/lichtblick \
      --add-flags $out/share/lichtblick/resources/app.asar \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}" \
      --set ELECTRON_FORCE_IS_PACKAGED=1 \
      --inherit-argv0
  '';
})
