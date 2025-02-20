{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
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
  version = "0.2.9-1";
  src = finalAttrs.passthru.sources."automatika_ros_sugar";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-numpy" ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs lifecycle-msgs nav-msgs rclcpp rclpy rosidl-default-runtime sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-msgpack" "python3-opencv" "python3-setproctitle" ]; };
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_ros_sugar" = substituteSource {
      src = fetchgit {
        name = "automatika_ros_sugar-source";
        url = "https://github.com/ros2-gbp/automatika_ros_sugar-release.git";
        rev = "fd14f4cefb87c97d74f8ea7da9f12b45d955cfca";
        hash = "sha256-xFA980HJSbsGcJ83E/dwVP8bXvkZn7Y3qpaTQ7GnnEU=";
      };
    };
  });
  meta = {
    description = "Syntactic sugar for ROS2 nodes creation and management";
  };
})
