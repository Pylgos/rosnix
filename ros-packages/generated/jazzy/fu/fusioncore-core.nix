{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "fusioncore_core";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."fusioncore_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_core" = substituteSource {
      src = fetchgit {
        name = "fusioncore_core-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "ec4e235451f1196d0d5a651169211d8256c449ca";
        hash = "sha256-aWIGwe5LpLwH/cnghfs2PRjiwvvmxEsZxUJJC+4AnRo=";
      };
    };
  });
  meta = {
    description = "FusionCore pure C++ sensor fusion library. No ROS dependency.";
  };
})
