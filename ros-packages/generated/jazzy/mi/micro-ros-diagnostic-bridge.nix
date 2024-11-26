{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  micro-ros-diagnostic-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "micro_ros_diagnostic_bridge";
  version = "0.3.0-6";
  src = finalAttrs.passthru.sources."micro_ros_diagnostic_bridge";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-msgs micro-ros-diagnostic-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common diagnostic-msgs micro-ros-diagnostic-msgs osrf-testing-tools-cpp ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "micro_ros_diagnostic_bridge" = substituteSource {
      src = fetchgit {
        name = "micro_ros_diagnostic_bridge-source";
        url = "https://github.com/ros2-gbp/micro_ros_diagnostics-release.git";
        rev = "453216f9df2aeba2bd83c63ba0fe56186fc34585";
        hash = "sha256-mBsQdSKOPVQJVBc/FxvaxH5NOtAJy3M+bYciq7eHg+c=";
      };
    };
  });
  meta = {
    description = "Translates micro-ROS diagnostic messages to vanilla ROS 2 diagnostic messages.";
  };
})
