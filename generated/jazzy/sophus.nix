{
  buildRosPackage,
  ceres-solver,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  substituteSource,
}:
let
  sources = rec {
    sophus = substituteSource {
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
          to = "URL ${sophus-vendor_source-pybind11-0}";
        }
      ];
    };
    sophus-vendor_source-pybind11-0 = substituteSource {
      src = fetchgit {
        name = "sophus-vendor_source-pybind11-0-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "aeda49ed0b4e6e8abba7abc265ace86a6c26ba66";
        hash = "sha256-LclQRkJHqaXEf+A4bndFsb4AZEipX3L6i8yualz2e5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sophus";
  version = "1.22.9102-2";
  src = sources.sophus;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fmt ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ implementation of Lie Groups using Eigen.";
  };
}
