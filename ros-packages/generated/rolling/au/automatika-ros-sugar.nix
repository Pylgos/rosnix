{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automatika_ros_sugar";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."automatika_ros_sugar";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs lifecycle-msgs nav-msgs rclcpp rclpy rosidl-default-runtime sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-msgpack" "python3-numpy" "python3-opencv" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_ros_sugar" = substituteSource {
      src = fetchgit {
        name = "automatika_ros_sugar-source";
        url = "https://github.com/ros2-gbp/automatika_ros_sugar-release.git";
        rev = "7c42f37ff3f1e92de8b31d12651f70ae0e854df6";
        hash = "sha256-M7KE366VNCdPLLuKlXLBwNkBQ4jTyGepfTK8OJcDTEI=";
      };
    };
  });
  meta = {
    description = "Syntactic sugar for ROS2 nodes creation and management";
  };
})
