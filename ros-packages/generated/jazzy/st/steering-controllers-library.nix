{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "steering_controllers_library";
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."steering_controllers_library";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp rclcpp-lifecycle rcpputils ];
  propagatedBuildInputs = [ backward-ros control-msgs controller-interface geometry-msgs hardware-interface nav-msgs pluginlib realtime-tools ros2-control-cmake std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "steering_controllers_library" = substituteSource {
      src = fetchgit {
        name = "steering_controllers_library-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "9e8c13a967c555c2512151aa7542ecd147e61713";
        hash = "sha256-BlUIAIOc8y8urWxdqxHhePBOAGrkCmadK7lAzyglbBE=";
      };
    };
  });
  meta = {
    description = "Package for steering robot configurations including odometry and interfaces.";
  };
})
