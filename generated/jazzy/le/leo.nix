{
  ament_cmake,
  buildRosPackage,
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
    leo-096460a339bcbe739b5becd7655b304416b02fc4 = substituteSource {
      src = fetchgit {
        name = "leo-096460a339bcbe739b5becd7655b304416b02fc4-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "096460a339bcbe739b5becd7655b304416b02fc4";
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
  src = sources.leo-096460a339bcbe739b5becd7655b304416b02fc4;
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
