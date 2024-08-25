{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
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
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_planner = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "45a4afb2e35f2ac1e35523f7d9d835b67b0c77c8";
        hash = "sha256-CuV66uDE8qqUIv5493Q/ioiMPk3u/3nud6j4090nicg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_planner";
  version = "1.3.1-1";
  src = sources.nav2_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2 planner server package";
  };
}
