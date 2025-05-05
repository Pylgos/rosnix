{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_utils";
  version = "1.6.2-1";
  src = finalAttrs.passthru.sources."rmf_utils";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_utils" = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "45dfebf8e030a6c3a5817c41883b871daab829a1";
        hash = "sha256-v0ho2LvZxTvkDGnOgTDbMk3fKAsWxhTBqiV3M8emWxI=";
      };
    };
  });
  meta = {
    description = "Simple C++ programming utilities used by Robotics Middleware Framework packages";
  };
})
