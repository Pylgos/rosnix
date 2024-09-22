{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport_plugins,
  rclpy,
  rosSystemPackages,
  ros_gz,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    nicla_vision_ros2 = substituteSource {
      src = fetchFromGitHub {
        name = "nicla_vision_ros2-source";
        owner = "ros2-gbp";
        repo = "nicla_vision_ros2-release";
        rev = "b33eddec43e1c091d1fa1ba7e2f472af3c16a049";
        hash = "sha256-kbqf497KvUCBEGGx97IAV0I88+cAqKYb5ADFrvcO9hE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nicla_vision_ros2";
  version = "1.1.1-1";
  src = sources.nicla_vision_ros2;
  nativeBuildInputs = [ ament_cmake ament_cmake_python rosidl_default_generators wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_transport_plugins rclpy ros_gz rosidl_default_runtime sensor_msgs std_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integration of the Arduino Nicla Vision board in the ROS2 world. Sensors data from the Nicla Vision is collected and trasmited to the relevant ROS2 topics";
  };
}
