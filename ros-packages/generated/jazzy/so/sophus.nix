{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "sophus" = substituteSource {
      src = fetchgit {
        name = "sophus-source";
        url = "https://github.com/ros2-gbp/sophus-release.git";
        rev = "39c729040cd2c3720879b0df85f162c4ac789877";
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
        rev = "330aae51cfdeeb2e125ed2d738def3695c464427";
        hash = "sha256-R4wY/VlbYA3ead6Y2RvopVLtAtU9p9h1qQxXPqB6J3w=";
      };
      substitutions = [
      ];
    };
  });
in
buildCmakePackage (finalAttrs: {
  pname = "sophus";
  version = "1.22.9102-2";
  src = finalAttrs.passthru.sources."sophus";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "C++ implementation of Lie Groups using Eigen.";
  };
})
