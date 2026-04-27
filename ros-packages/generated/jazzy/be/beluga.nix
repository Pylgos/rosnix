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
  version = "2.1.1-1";
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
        rev = "24a504fc1032fe276685b3ac4d74a9ccc0de8709";
        hash = "sha256-K/Lj81Bh0miQIPQ7MOtJyQRt+RFfUF1vyLE4HlkWlhI=";
      };
    };
  });
  meta = {
    description = "A generic MCL library for ROS2.";
  };
})
