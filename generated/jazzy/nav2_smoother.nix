{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "98bd663934007eee69743338bfe9b49004d4ad66";
        hash = "sha256-YcFWs95kYyBgeuBq9633eHaNCBuQlUjrIynvDB8JDoA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smoother";
  version = "1.3.1-1";
  src = sources.nav2_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Smoother action interface";
  };
}
