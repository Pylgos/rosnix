{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_description,
  joint_state_publisher,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    turtlebot4_description = substituteSource {
      src = fetchgit {
        name = "turtlebot4_description-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "ccfb5713bf190805b3b41df918bc2b99f7ddb686";
        hash = "sha256-BIElYVfO/DRlFM3pX8rxlelWrgR3QA6XSL+xXBzwd3w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_description";
  version = "2.0.1-1";
  src = sources.turtlebot4_description;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot_create_description joint_state_publisher robot_state_publisher urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Description package";
  };
}
