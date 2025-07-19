{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  python-cmake-module,
  rclcpp,
  rclpy,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  tinyxml2-vendor,
  vision-msgs,
  webots-ros2-importer,
  webots-ros2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "webots_ros2_driver";
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedNativeBuildInputs = [ geometry-msgs pluginlib rclcpp rclpy ros-environment sensor-msgs std-msgs tf2-geometry-msgs tf2-ros tinyxml2-vendor vision-msgs webots-ros2-importer webots-ros2-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedBuildInputs = [ geometry-msgs pluginlib rclcpp rclpy ros-environment sensor-msgs std-msgs tf2-geometry-msgs tf2-ros tinyxml2-vendor vision-msgs webots-ros2-importer webots-ros2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_driver" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_driver-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "644eeb896655c80366baad4dc2155b7eaad0b44e";
        hash = "sha256-zTo4QcJCcUU1comC4AWrApF5g/bxQXRrJC8OqnE+Pns=";
      };
    };
  });
  meta = {
    description = "Implementation of the Webots - ROS 2 interface";
  };
})
