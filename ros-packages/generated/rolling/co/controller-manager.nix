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
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  launch,
  launch-ros,
  libstatistics-collector,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  realtime-tools,
  ros2-control-test-assets,
  ros2param,
  ros2run,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "controller_manager";
  version = "4.21.0-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp backward-ros controller-interface controller-manager-msgs diagnostic-updater generate-parameter-library hardware-interface launch launch-ros libstatistics-collector pluginlib rclcpp rcpputils realtime-tools ros2-control-test-assets ros2param ros2run std-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest hardware-interface-testing ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "52dc81afdd2fd59a73030a5acbb4802fa2380a21";
        hash = "sha256-dj9kLiibPa+3XJXHNIpPKmhRVIarRPcep2gR4SrymIo=";
      };
    };
  });
  meta = {
    description = "Description of controller_manager";
  };
})
