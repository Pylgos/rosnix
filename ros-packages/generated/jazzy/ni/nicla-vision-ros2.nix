{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport-plugins,
  mkSourceSet,
  rclpy,
  ros-gz,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nicla_vision_ros2";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."nicla_vision_ros2";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-transport-plugins rclpy ros-gz rosidl-default-runtime sensor-msgs std-msgs xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nicla_vision_ros2" = substituteSource {
        src = fetchgit {
          name = "nicla_vision_ros2-source";
          url = "https://github.com/ros2-gbp/nicla_vision_ros2-release.git";
          rev = "b33eddec43e1c091d1fa1ba7e2f472af3c16a049";
          hash = "sha256-kbqf497KvUCBEGGx97IAV0I88+cAqKYb5ADFrvcO9hE=";
        };
      };
    });
  };
  meta = {
    description = "Integration of the Arduino Nicla Vision board in the ROS2 world. Sensors data from the Nicla Vision is collected and trasmited to the relevant ROS2 topics";
  };
})
