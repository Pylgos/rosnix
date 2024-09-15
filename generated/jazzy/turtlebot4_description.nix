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
        rev = "b0685cda3465b670d00f6e7e57ab8c46ea69818b";
        hash = "sha256-+IvkwZOu0aRXQ3ZGY/7bqh7i0AAH6EUm844Cd2pVVp0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_description";
  version = "2.0.0-1";
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
