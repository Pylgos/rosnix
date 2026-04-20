{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-flake8,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  greenwave-monitor-interfaces,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "greenwave_monitor";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."greenwave_monitor";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ diagnostic-msgs greenwave-monitor-interfaces launch launch-ros rclcpp rclpy rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-msgs greenwave-monitor-interfaces launch launch-ros rclcpp rclpy rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-pytest ament-flake8 ament-lint-auto ament-lint-common ament-pep257 launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "greenwave_monitor" = substituteSource {
      src = fetchgit {
        name = "greenwave_monitor-source";
        url = "https://github.com/ros2-gbp/greenwave_monitor-release.git";
        rev = "5ab63d81ba7511e810a321494ff9984d099e9484";
        hash = "sha256-64yRtugKBi6z29OuwQFXoTaqTPNRaiUG+57hDqPvDtc=";
      };
    };
  });
  meta = {
    description = "A ROS 2 diagnostic tool for monitoring topic frame rates and latency metrics.";
  };
})
