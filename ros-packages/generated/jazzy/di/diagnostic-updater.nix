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
  version = "4.2.2-1";
  src = finalAttrs.passthru.sources."diagnostic_updater";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ros rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_updater" = substituteSource {
      src = fetchgit {
        name = "diagnostic_updater-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "0ac9289698382ce40b7fc52877b38ab7dc784426";
        hash = "sha256-HUgkGX43tjk5GHALIWFwrL5J2B7GbZWXXChlc+KTAH4=";
      };
    };
  });
  meta = {
    description = "diagnostic_updater contains tools for easily updating diagnostics. it is commonly used in device drivers to keep track of the status of output topics, device status, etc.";
  };
})
