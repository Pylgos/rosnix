{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_theta_star_planner = substituteSource {
      src = fetchgit {
        name = "nav2_theta_star_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "cdfa41da67baef0ceb8dc10d8bea39e2a68c77c1";
        hash = "sha256-cI+YETmKxi90sb4WdERWy/pqbN0Y6ZRMT2YfmZiU4oI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_theta_star_planner";
  version = "1.3.1-1";
  src = sources.nav2_theta_star_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Theta* Global Planning Plugin";
  };
}
