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
  version = "0.2.5-1";
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
        rev = "d424aef7ee590a5aeb97b4c1c24f169c1c84bf5e";
        hash = "sha256-r1CilmLjSS8ys78mANYmAjTb0UAmsvBPloUouC+erEY=";
      };
    };
  });
  meta = {
    description = "Core C++ library for NavMap.";
  };
})
