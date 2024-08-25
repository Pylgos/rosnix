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
    nav2_navfn_planner = substituteSource {
      src = fetchgit {
        name = "nav2_navfn_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "61a74dd182e3cc0581936a8b280ffa6496dd4426";
        hash = "sha256-S8ZnqN5czsKrDQRnUIiYxBGC4OKOfyaNhk0ndP4yAPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_navfn_planner";
  version = "1.3.1-1";
  src = sources.nav2_navfn_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Nav2 NavFn planner";
  };
}
