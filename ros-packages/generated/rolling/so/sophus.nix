{
  buildRosPackage,
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
        rev = "7e418f49243bb7d13fa92cf2634af1eeac386465";
        hash = "sha256-XZIS48ZWNBHBMr+gvxCuimD24jAIU8P/fUoDiBhQzaU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "sophus";
  version = "1.22.9102-2";
  src = sources."sophus";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ implementation of Lie Groups using Eigen.";
  };
}