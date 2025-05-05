{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-aggregator,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosgraph-monitor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosgraph_monitor";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."rosgraph_monitor";
  nativeBuildInputs = [ ament-cmake generate-parameter-library ];
  propagatedNativeBuildInputs = [ diagnostic-aggregator diagnostic-msgs pluginlib rclcpp rclcpp-components rosgraph-monitor-msgs ];
  buildInputs = [ ament-cmake generate-parameter-library ];
  propagatedBuildInputs = [ diagnostic-aggregator diagnostic-msgs pluginlib rclcpp rclcpp-components rosgraph-monitor-msgs ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rosgraph_monitor" = substituteSource {
      src = fetchgit {
        name = "rosgraph_monitor-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "9a56221c26c37c05a26029340dec6229e02885a4";
        hash = "sha256-CpCd6vyjSogfz6Rmr/x4NAq/mF2VHtBBE+rQDQByz7c=";
      };
    };
  });
  meta = {
    description = "Monitors the ROS graph to detect error conditions";
  };
})
