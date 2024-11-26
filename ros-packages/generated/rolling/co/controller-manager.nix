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
  hardware-interface,
  hardware-interface-testing,
  launch,
  launch-ros,
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
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."controller_manager";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp backward-ros controller-interface controller-manager-msgs diagnostic-updater hardware-interface launch launch-ros pluginlib rclcpp rcpputils realtime-tools ros2-control-test-assets ros2param ros2run std-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-pytest hardware-interface-testing ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-coverage" ]; };
  passthru.sources = mkSourceSet (sources: {
    "controller_manager" = substituteSource {
      src = fetchgit {
        name = "controller_manager-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "5c64757b2349b21d98f2f42a831dd940acb9a33c";
        hash = "sha256-hpBmgk2l+h3PHWfF9HSb3ZBja3g287KRoyxXHA5y5XQ=";
      };
    };
  });
  meta = {
    description = "Description of controller_manager";
  };
})
