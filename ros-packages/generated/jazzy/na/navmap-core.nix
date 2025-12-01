{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_core";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."navmap_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "navmap_core" = substituteSource {
      src = fetchgit {
        name = "navmap_core-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "e339fd9622816e932ce09f358091162bc3d66bbc";
        hash = "sha256-9WvhyLGaR4FtREAx966KECjDN78S0aFtPu7EMSZKQbU=";
      };
    };
  });
  meta = {
    description = "Core C++ library for NavMap.";
  };
})
