{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pybind11-vendor_source-7e418f49243bb7d13fa92cf2634af1eeac386465 = substituteSource {
      src = fetchgit {
        name = "pybind11-vendor_source-7e418f49243bb7d13fa92cf2634af1eeac386465-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "7e418f49243bb7d13fa92cf2634af1eeac386465";
        hash = "sha256-XZIS48ZWNBHBMr+gvxCuimD24jAIU8P/fUoDiBhQzaU=";
      };
      substitutions = [
      ];
    };
    sophus-39c729040cd2c3720879b0df85f162c4ac789877 = substituteSource {
      src = fetchgit {
        name = "sophus-39c729040cd2c3720879b0df85f162c4ac789877-source";
        url = "https://github.com/ros2-gbp/sophus-release.git";
        rev = "39c729040cd2c3720879b0df85f162c4ac789877";
        hash = "sha256-xTS2ysDs9SSKpvKrxnhooJVtfpwRvYCuMpbFc4skbDM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${pybind11-vendor_source-7e418f49243bb7d13fa92cf2634af1eeac386465}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "sophus";
  version = "1.22.9102-2";
  src = sources.sophus-39c729040cd2c3720879b0df85f162c4ac789877;
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
