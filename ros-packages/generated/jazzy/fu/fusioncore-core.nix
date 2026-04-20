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
  version = "0.1.1-1";
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
        rev = "4c416d5ac6e565b3a9f4551b3d0761af88a8d1a7";
        hash = "sha256-CdotVS8JUgSgAhSdpK/eilk0+Gl4nbYfMkPNHhW7kCY=";
      };
    };
  });
  meta = {
    description = "FusionCore pure C++ sensor fusion library. No ROS dependency.";
  };
})
