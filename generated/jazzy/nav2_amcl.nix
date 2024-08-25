{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  message_filters,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_amcl = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9f742b9ca81abbb94d104c1df1d2a758342f885e";
        hash = "sha256-9kwfyxHaUTkmY0XuvccTi0Bl+1WKU7Le7k7n5aW2KSo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_amcl";
  version = "1.3.1-1";
  src = sources.nav2_amcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros launch_testing message_filters nav2_common nav2_msgs nav2_util nav_msgs pluginlib rclcpp sensor_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "";
  };
}
