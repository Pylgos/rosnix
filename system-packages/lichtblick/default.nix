{
  stdenv,
  fetchFromGitHub,
  nodejs,
  yarn-berry_3,
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
  ];

  offlineCache = yarn-berry.fetchYarnBerryDeps {
    inherit (finalAttrs) src missingHashes;
    hash = "sha256-rxGKRzzCDaZuAJwOStDzdZDLxg++/aAUXwaoYemKx7Y=";
  };

  missingHashes = ./missing-hashes.json;

  postPatch = ''
    shopt -s globstar
    for file in **/package.json; do
      echo "Patching $file"
      substituteInPlace "$file" --replace-warn '"packageManager": "yarn@3.6.3",' ""
    done
    cat package.json
  '';

  buildPhase = ''
    yarn run desktop:build:prod
    yarn run package:linux
  '';

  # COREPACK_ENABLE_STRICT = "0";
  COREPACK_ENABLE = "0";
})
