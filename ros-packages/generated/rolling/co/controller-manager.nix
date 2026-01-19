{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-pytest,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager-msgs,
  diagnostic-updater,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  libstatistics-collector,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclpy,
  realtime-tools,
  robot-state-publisher,
  ros2-control-cmake,
  ros2-control-test-assets,
  ros2param,
  ros2pkg,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager";
  version = "6.3.2-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros launch-testing-ros libstatistics-collector lifecycle-msgs pluginlib rcl-interfaces rclcpp rclpy realtime-tools ros2-control-cmake ros2param sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "python3-filelock" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros launch-testing-ros libstatistics-collector lifecycle-msgs pluginlib rcl-interfaces rclcpp rclpy realtime-tools ros2-control-cmake ros2param sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "python3-filelock" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest example-interfaces hardware-interface-testing launch-testing robot-state-publisher ros2-control-test-assets ros2pkg ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "d2d12e8a50ee3ce20433f7cdef77ce88973bfa31";
        hash = "sha256-qoU6IXy82iu+/JjlQM2Rotw67fUdjIW0nTTNeoAQXuw=";
      };
    };
  });
  meta = {
    description = "The main runnable entrypoint of ros2_control and home of controller management and resource management.";
  };
})
