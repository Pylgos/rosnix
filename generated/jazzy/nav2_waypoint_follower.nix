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
        rev = "f3ef643e5c81b498b5fcdc3bf2d937b4fa93b104";
        hash = "sha256-0cD4CecbDGvV70fMa3RmgpZ5MHzPM4Pm/ee7ksLer8M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_waypoint_follower";
  version = "1.3.2-1";
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
