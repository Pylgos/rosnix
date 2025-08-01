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
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclpy,
  rcpputils,
  realtime-tools,
  robot-state-publisher,
  ros2-control-cmake,
  ros2-control-test-assets,
  ros2param,
  ros2run,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager";
  version = "4.34.0-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros libstatistics-collector pluginlib rclcpp rcpputils realtime-tools ros2-control-cmake ros2-control-test-assets ros2param ros2run std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "python3-filelock" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros libstatistics-collector pluginlib rclcpp rcpputils realtime-tools ros2-control-cmake ros2-control-test-assets ros2param ros2run std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "python3-filelock" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest example-interfaces hardware-interface-testing launch launch-testing launch-testing-ros rclpy robot-state-publisher ros2-control-test-assets sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "32e32d53c11bf8be1830a6dd531035bc86838b5c";
        hash = "sha256-wSnip39Xf7p2MFSS3VOl90+2lB5XnMDI6xHEd+g6Zps=";
      };
    };
  });
  meta = {
    description = "The main runnable entrypoint of ros2_control and home of controller management and resource management.";
  };
})
