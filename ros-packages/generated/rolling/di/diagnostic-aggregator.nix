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
  version = "4.4.4-1";
  src = finalAttrs.passthru.sources."diagnostic_aggregator";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ diagnostic-msgs pluginlib rcl-interfaces rclcpp rclpy std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-msgs pluginlib rcl-interfaces rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch-pytest launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_aggregator" = substituteSource {
      src = fetchgit {
        name = "diagnostic_aggregator-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "11089f16ab97a92cc8f648e6bc0eb2a96a9b2a02";
        hash = "sha256-rhfKfI8VYgVhUrMrhVemHo6dmsEl+25kPKnegAg9QKM=";
      };
    };
  });
  meta = {
    description = "diagnostic_aggregator";
  };
})
