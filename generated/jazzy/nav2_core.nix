{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  nav2_behavior_tree,
  nav2_common,
  nav2_costmap_2d,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    nav2_core = substituteSource {
      src = fetchgit {
        name = "nav2_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "1a22cd5d49ea960256cf09ef4ab91a227eef733e";
        hash = "sha256-oaIrrYY4yd3YDxaPmTLVqF/W50925gyNWSEzPUKN+yk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_core";
  version = "1.3.1-1";
  src = sources.nav2_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_behavior_tree nav2_common nav2_costmap_2d nav2_util nav_msgs pluginlib rclcpp rclcpp_lifecycle std_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "A set of headers for plugins core to the Nav2 stack";
  };
}
