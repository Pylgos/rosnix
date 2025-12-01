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
  version = "0.4.0-1";
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
        rev = "b74b04dd8c75d76fee911b30cff50603824e7e21";
        hash = "sha256-vJ+BSFC3FK6iIsrNTw0YvyzrQy+bETIwlh+WMLYQ+54=";
      };
    };
  });
  meta = {
    description = "Core C++ library for NavMap.";
  };
})
