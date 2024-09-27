{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  pluginlib,
  python_cmake_module,
  rclcpp,
  rclpy,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tinyxml2_vendor,
  vision_msgs,
  webots_ros2_importer,
  webots_ros2_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "webots_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_driver-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "e4b5418d661d13d7841e889fe614d4f7c8cfe06e";
        hash = "sha256-G6weVTbEsygOn7dKbZRH3n+HRo2Yz1i2JeACgKMjWwk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "webots_ros2_driver";
  version = "2023.1.3-1";
  src = sources."webots_ros2_driver";
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs pluginlib rclcpp rclpy sensor_msgs std_msgs tf2_geometry_msgs tf2_ros tinyxml2_vendor vision_msgs webots_ros2_importer webots_ros2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of the Webots - ROS 2 interface";
  };
}
