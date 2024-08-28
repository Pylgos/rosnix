{
  ament_cmake,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rot_conv = substituteSource {
      src = fetchgit {
        name = "rot_conv-source";
        url = "https://github.com/ros2-gbp/rot_conv_lib-release.git";
        rev = "a61148e0f5bd8fbd7480973e37023da1777a9c5f";
        hash = "sha256-VqbATzeNKPD8JPuhSHw/tFUaehAd/D5z7SlyxRL1P9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rot_conv";
  version = "1.1.0-4";
  src = sources.rot_conv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A collection of functions that address common computations and numerical handling of rotations in 3D Euclidean space";
  };
}
