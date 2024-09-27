{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  mkSourceSet,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_description" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "d799d33ee1346defee3f1c815d5eb62102f6011e";
        hash = "sha256-r1KPRn5VOO/olYF6Mmv/bf6pcOMHjL89MxlPhLetbyI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_minimal_tb4_description";
  version = "1.0.1-1";
  src = sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher robot_state_publisher urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
}
