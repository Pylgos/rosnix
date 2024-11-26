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
  launch,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_updater";
  version = "4.2.1-1";
  src = finalAttrs.passthru.sources."diagnostic_updater";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ros rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_updater" = substituteSource {
      src = fetchgit {
        name = "diagnostic_updater-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "8eec70691fa50040dab0564f7553273f2f76615a";
        hash = "sha256-l8Doi5cd8VshXDpCzrPhRRL9QU8w/01pI3v+jE8q30c=";
      };
    };
  });
  meta = {
    description = "diagnostic_updater contains tools for easily updating diagnostics. it is commonly used in device drivers to keep track of the status of output topics, device status, etc.";
  };
})
