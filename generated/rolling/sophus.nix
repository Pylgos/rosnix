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
        rev = "dadc2a318c81321689a7d82279e99fed2a4948bc";
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
        rev = "0cf3a0f7b514b3a3fb541ad3197964fa5c4da554";
        hash = "sha256-T++MWgWVtQieU0zblW7QJ+kZHEhQxnOF2Hgh9ihvJKc=";
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
