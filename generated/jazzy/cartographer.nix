{
  abseil-cpp,
  buildRosPackage,
  cairo,
  ceres-solver,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  git,
  glog,
  gtest,
  lua5,
  protobuf,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    cartographer = substituteSource {
      src = fetchgit {
        name = "cartographer-source";
        url = "https://github.com/ros2-gbp/cartographer-release.git";
        rev = "9985ea5634e38f87cd15a64c35a15f34616d8e10";
        hash = "sha256-++Ii26FmyqOYF3zYOPtQ+2ZqNUMomOanyu7Z5uYyu/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer";
  version = "2.0.9003-2";
  src = sources.cartographer;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ git gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ abseil-cpp cairo ceres-solver eigen gflags glog lua5 protobuf python3Packages.boost python3Packages.sphinx ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations.";
  };
}
