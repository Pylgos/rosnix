{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-graceful-controller,
  nav2-msgs,
  nav2-util,
  opennav-docking-core,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."opennav_docking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core pluginlib rcl-interfaces rclcpp rclcpp-action rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-ros yaml-cpp-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-graceful-controller nav2-msgs nav2-util nav-msgs opennav-docking-core pluginlib rcl-interfaces rclcpp rclcpp-action rclcpp-components rclcpp-lifecycle sensor-msgs tf2 tf2-geometry-msgs tf2-ros yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking" = substituteSource {
      src = fetchgit {
        name = "opennav_docking-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "1d59ce092e8055891d1e44161ecfc6e882b6d83f";
        hash = "sha256-bjXo9PuG5AcXphwaQa84pe3zwDR0701vnkRhN+cPO1Q=";
      };
    };
  });
  meta = {
    description = "A Task Server for robot charger docking";
  };
})
