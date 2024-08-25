{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  robot_state_publisher,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    nav2_minimal_tb4_description = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "432d4a90df96c75d5c6c6578ea0f576fe3cad75d";
        hash = "sha256-r1KPRn5VOO/olYF6Mmv/bf6pcOMHjL89MxlPhLetbyI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_minimal_tb4_description";
  version = "1.0.1-1";
  src = sources.nav2_minimal_tb4_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
}
