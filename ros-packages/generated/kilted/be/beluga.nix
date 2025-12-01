{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  sophus,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "beluga";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."beluga";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ sophus ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libhdf5-dev" "range-v3" "tbb" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ sophus ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libhdf5-dev" "range-v3" "tbb" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" "clang-format" "clang-tidy" "gtest" "libgmock-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "beluga" = substituteSource {
      src = fetchgit {
        name = "beluga-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "8fa37117dda625c76e867ee916566c9fc893bfd5";
        hash = "sha256-hEw+699sJbleskHdUVAmPNHGEs6hyF8YiIwsIn9ewX0=";
      };
    };
  });
  meta = {
    description = "A generic MCL library for ROS2.";
  };
})
