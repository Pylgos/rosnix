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
  version = "2.0.2-1";
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
        rev = "5a4b604ada6fee862adc8b71acd5e7a8b76ad2bd";
        hash = "sha256-z5Drm8uEZ590QUMtDES+CD3DJd7gm0OYs542R0quhY8=";
      };
    };
  });
  meta = {
    description = "A generic MCL library for ROS2.";
  };
})
