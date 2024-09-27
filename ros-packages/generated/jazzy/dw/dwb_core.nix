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
  mkSourceSet,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  nav_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "dwb_core" = substituteSource {
      src = fetchgit {
        name = "dwb_core-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d601c7ec253305ccf6fef058cd1aaf913bfa9c1a";
        hash = "sha256-CxMMRdvdGeXbpXUmbJZ4RD5D+N8vMBzpzTF5GWasHLI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dwb_core";
  version = "1.3.2-1";
  src = sources."dwb_core";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dwb_msgs geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_util nav_2d_msgs nav_2d_utils nav_msgs pluginlib rclcpp sensor_msgs std_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "DWB core interfaces package";
  };
}
