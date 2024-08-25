{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  image_transport,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  robot_localization,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_waypoint_follower = substituteSource {
      src = fetchgit {
        name = "nav2_waypoint_follower-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b6de89407c0c277ece335caba67123ff2b442977";
        hash = "sha256-siSFfmlvB4EunVnhUzJixlqnF4hSvP2pcMu99qjhpos=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_waypoint_follower";
  version = "1.3.1-1";
  src = sources.nav2_waypoint_follower;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geographic_msgs image_transport nav2_common nav2_core nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle robot_localization tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A waypoint follower navigation server";
  };
}
