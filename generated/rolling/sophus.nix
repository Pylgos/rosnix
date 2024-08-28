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
        rev = "65f4266cefc48401fadd4623f5af430359a6866d";
        hash = "sha256-yAWTYNiSvYKAieTJlDPwwiUcs6jf9xdOGBN2D0TCIrA=";
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
