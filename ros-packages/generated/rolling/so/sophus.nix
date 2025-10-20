{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "sophus";
  version = "1.22.9102-2";
  src = finalAttrs.passthru.sources."sophus";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" "libceres-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libceres-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sophus" = substituteSource {
      src = fetchgit {
        name = "sophus-source";
        url = "https://github.com/ros2-gbp/sophus-release.git";
        rev = "dadc2a318c81321689a7d82279e99fed2a4948bc";
        hash = "sha256-xTS2ysDs9SSKpvKrxnhooJVtfpwRvYCuMpbFc4skbDM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${sources."sophus/pybind11"}";
        }
      ];
    };
    "sophus/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "e6984c805ec09c0e5f826e3081a32f322a6bfe63";
        hash = "sha256-lvyb1WG1l2j8iyQoiLGaQqAi2ghToamJ5JTlEmj6OWc=";
      };
    };
  });
  meta = {
    description = "\n   C++ implementation of Lie Groups using Eigen.\n  ";
  };
})
