{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_behavior_tree,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_behaviors = substituteSource {
      src = fetchgit {
        name = "nav2_behaviors-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "95110e59dd0b72de7eabca4f781342e54dcb9c78";
        hash = "sha256-vedWvaNjpM1Xr+nRzotbnCu9rirmpsItL6zgp6+HPgY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behaviors";
  version = "1.3.1-1";
  src = sources.nav2_behaviors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2 behavior server";
  };
}
