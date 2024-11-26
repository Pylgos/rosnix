{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yaets";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."yaets";
  propagatedNativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "yaets" = substituteSource {
        src = fetchgit {
          name = "yaets-source";
          url = "https://github.com/fmrico/yaets-release.git";
          rev = "61cad49f2230d2635ce87fbabc890cff2c2e8283";
          hash = "sha256-FbwIEobk14UaDzCP6o5keSFX7JRpcmecuYjOFmNVnoE=";
        };
      };
    });
  };
  meta = {
    description = "This package provides a execution tracing library.";
  };
})
