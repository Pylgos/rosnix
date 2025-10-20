{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmw-implementation,
  rmw-stats-shim,
  rosSystemPackages,
  rosgraph-monitor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_monitor";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rosgraph_monitor";
  nativeBuildInputs = [ ament-cmake generate-parameter-library ];
  propagatedNativeBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater rclcpp rclcpp-components rosgraph-monitor-msgs ];
  buildInputs = [ ament-cmake generate-parameter-library ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-msgs diagnostic-updater rclcpp rclcpp-components rosgraph-monitor-msgs ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake rmw-implementation rmw-stats-shim ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_monitor" = substituteSource {
      src = fetchgit {
        name = "rosgraph_monitor-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "420810d6c2f19b668c2edb0b8ec37de7d9447dc4";
        hash = "sha256-a6UD71XCYxQPlhg9+qrFGcDkNtD9A+4e4ooF2Vs3C5M=";
      };
    };
  });
  meta = {
    description = "Monitors the ROS graph to detect error conditions";
  };
})
