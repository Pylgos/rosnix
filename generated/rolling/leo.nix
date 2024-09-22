{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_msgs,
  leo_teleop,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    leo = substituteSource {
      src = fetchFromGitHub {
        name = "leo-source";
        owner = "ros2-gbp";
        repo = "leo_common-release";
        rev = "fb908a97861b43c2c72b2ec5ed193a3adf0f5201";
        hash = "sha256-qRmRxzhzTgwKSELlVR4rhl4PT3KhP04L3wJCEVsnpSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo";
  version = "3.0.3-1";
  src = sources.leo;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ leo_description leo_msgs leo_teleop ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage of software for Leo Rover common to the robot and ROS desktop";
  };
}
