{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-cv,
  grid-map-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-msgs,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage-default-plugins,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_ros";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs grid-map-cmake-helpers grid-map-core grid-map-cv grid-map-msgs nav2-msgs nav-msgs rclcpp rcutils rosbag2-cpp sensor-msgs std-msgs tf2 visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs grid-map-cmake-helpers grid-map-core grid-map-cv grid-map-msgs nav2-msgs nav-msgs rclcpp rcutils rosbag2-cpp sensor-msgs std-msgs tf2 visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosbag2-storage-default-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_ros" = substituteSource {
      src = fetchgit {
        name = "grid_map_ros-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "f70d27e6c64ba3ecd60b033ace3698faf5e7cb8f";
        hash = "sha256-CRbW376HPhtdNMmpHd4AXJimFJ79/94JEVyU0wb3MbQ=";
      };
    };
  });
  meta = {
    description = "ROS interface for the grid map library to manage two-dimensional grid maps with multiple data layers.";
  };
})
