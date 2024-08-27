{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  costmap_queue,
  dwb_core,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_costmap_2d,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dwb_critics = substituteSource {
      src = fetchgit {
        name = "dwb_critics-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "00046f3080526574858c7f69ce01afc7863a2db5";
        hash = "sha256-c+8YZUUvd0Ipo9SmePe+EIe5+BTSHmj7MzT6l2EuTI4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_critics";
  version = "1.3.2-1";
  src = sources.dwb_critics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles costmap_queue dwb_core geometry_msgs nav2_common nav2_costmap_2d nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The dwb_critics package";
  };
}
