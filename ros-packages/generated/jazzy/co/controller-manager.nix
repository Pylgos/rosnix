{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-cpp,
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
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros libstatistics-collector pluginlib rclcpp rcpputils realtime-tools ros2-control-test-assets ros2param ros2run std-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest example-interfaces hardware-interface-testing launch launch-testing launch-testing-ros rclpy robot-state-publisher ros2-control-test-assets sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "1cb22112ceac6a881f2e2684498a789a42857bb2";
        hash = "sha256-hwtYKRpQmbV5GTobf3VGAgCP6bzS0Rtw+anwikU29hE=";
      };
    };
  });
  meta = {
    description = "Description of controller_manager";
  };
})
