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
  libyamlcpp,
  pluginlib,
  python_cmake_module,
  rclcpp,
  rclpy,
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
  sources = rec {
    webots_ros2_driver = substituteSource {
      src = fetchgit {
        name = "webots_ros2_driver-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "f25a8ae6bdde248411467d08b251b25bec2f8a88";
        hash = "sha256-G6weVTbEsygOn7dKbZRH3n+HRo2Yz1i2JeACgKMjWwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_driver";
  version = "2023.1.3-1";
  src = sources.webots_ros2_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs libyamlcpp pluginlib rclcpp rclpy sensor_msgs std_msgs tf2_geometry_msgs tf2_ros tinyxml2_vendor vision_msgs webots_ros2_importer webots_ros2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Implementation of the Webots - ROS 2 interface";
  };
}
