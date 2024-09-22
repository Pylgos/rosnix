{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rot_conv = substituteSource {
      src = fetchFromGitHub {
        name = "rot_conv-source";
        owner = "ros2-gbp";
        repo = "rot_conv_lib-release";
        rev = "4a8368c9cb014d6ff01e9aaf5b2433bc59dfaa8c";
        hash = "sha256-VqbATzeNKPD8JPuhSHw/tFUaehAd/D5z7SlyxRL1P9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rot_conv";
  version = "1.1.0-3";
  src = sources.rot_conv;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A collection of functions that address common computations and numerical handling of rotations in 3D Euclidean space";
  };
}
