{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pytest,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_aggregator";
  version = "4.3.1-1";
  src = finalAttrs.passthru.sources."diagnostic_aggregator";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-msgs pluginlib rcl-interfaces rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch-pytest launch-testing-ament-cmake launch-testing-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "diagnostic_aggregator" = substituteSource {
        src = fetchgit {
          name = "diagnostic_aggregator-source";
          url = "https://github.com/ros2-gbp/diagnostics-release.git";
          rev = "37a392e96761542fcda890216b400d1bf36bd09a";
          hash = "sha256-W0Tdf/Yhy7H7CY58VyRJMmJ+M2279VMtp+BEhLvriZA=";
        };
      };
    });
  };
  meta = {
    description = "diagnostic_aggregator";
  };
})
