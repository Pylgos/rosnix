{
  ackermann-msgs,
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
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."steering_controllers_library";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-msgs backward-ros control-msgs controller-interface generate-parameter-library geometry-msgs hardware-interface nav-msgs pluginlib rclcpp rclcpp-lifecycle rcpputils realtime-tools std-srvs tf2 tf2-geometry-msgs tf2-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "steering_controllers_library" = substituteSource {
      src = fetchgit {
        name = "steering_controllers_library-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "86b4362c1dd250e7e02c193afde62d8d36487e13";
        hash = "sha256-xz+SSSIVowRJ59LKw6dPIQfCzDqrECEsKQaB1ArSLcI=";
      };
    };
  });
  meta = {
    description = "Package for steering robot configurations including odometry and interfaces.";
  };
})
