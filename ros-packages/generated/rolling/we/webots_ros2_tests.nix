{
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  mkSourceSet,
  rclpy,
  ros2bag,
  rosSystemPackages,
  rosbag2_storage_default_plugins,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  webots_ros2_driver,
  webots_ros2_epuck,
  webots_ros2_mavic,
  webots_ros2_tesla,
  webots_ros2_tiago,
  webots_ros2_turtlebot,
  webots_ros2_universal_robot,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_tests" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tests-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "a7f009b55f9d2633e0116c371607314aca00f018";
        hash = "sha256-+wUzk/GLCWgQFUMICjLZSMB88GdfByKNut+61rY2A/Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "webots_ros2_tests";
  version = "2023.1.3-1";
  src = sources."webots_ros2_tests";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2bag rosbag2_storage_default_plugins webots_ros2_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright geometry_msgs launch launch_testing launch_testing_ament_cmake launch_testing_ros sensor_msgs std_msgs std_srvs tf2_ros webots_ros2_epuck webots_ros2_mavic webots_ros2_tesla webots_ros2_tiago webots_ros2_turtlebot webots_ros2_universal_robot ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "System tests for `webots_ros2` packages.";
  };
}
