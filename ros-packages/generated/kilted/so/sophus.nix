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
  version = "1.22.9102-3";
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
        rev = "7a6c73b3f895cc2e9ccca68c315795a4b9a77e54";
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
        rev = "af796d0a99f0cbd9aebb10591257c41a56811cf6";
        hash = "sha256-PJDKzanzRb+rjb+HeOy76AopZk6kyw+50zUXy+rfkWE=";
      };
    };
  });
  meta = {
    description = "\n   C++ implementation of Lie Groups using Eigen.\n  ";
  };
})
