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
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."automatika_ros_sugar";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs lifecycle-msgs nav-msgs rclcpp rclpy rosidl-default-runtime sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-attrs" "python3-jinja2" "python3-msgpack" "python3-msgpack-numpy" "python3-numpy" "python3-opencv" "python3-setproctitle" "python3-toml" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs lifecycle-msgs nav-msgs rclcpp rclpy rosidl-default-runtime sensor-msgs std-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-attrs" "python3-jinja2" "python3-msgpack" "python3-msgpack-numpy" "python3-numpy" "python3-opencv" "python3-setproctitle" "python3-toml" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-pytest ament-index-python ament-lint-auto launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_ros_sugar" = substituteSource {
      src = fetchgit {
        name = "automatika_ros_sugar-source";
        url = "https://github.com/ros2-gbp/automatika_ros_sugar-release.git";
        rev = "a4c3eea18cb705fd4e79c2a190d51ab4ab272a47";
        hash = "sha256-Weq5JURhdHmvoQ3mGjtb1uQE7iMJBDURkCowRcD+KWk=";
      };
    };
  });
  meta = {
    description = "Syntactic sugar for ROS2 nodes creation and management";
  };
})
