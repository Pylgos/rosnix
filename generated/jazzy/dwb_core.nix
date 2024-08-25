{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dwb_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    dwb_core = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3b7115c77ba40cf49486b72cbe5758a34650d915";
        hash = "sha256-2R+xjO19EMMv5DrSNdzw+UMv1uyYYYJcolX/DRKkfgM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_core";
  version = "1.3.1-1";
  src = sources.dwb_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dwb_msgs geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_util nav_2d_msgs nav_2d_utils nav_msgs pluginlib rclcpp sensor_msgs std_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "DWB core interfaces package";
  };
}
