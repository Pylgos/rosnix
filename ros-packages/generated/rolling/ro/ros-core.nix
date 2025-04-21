{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  common-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  launch-xml,
  launch-yaml,
  mkSourceSet,
  pluginlib,
  rcl-lifecycle,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rclpy,
  ros-environment,
  ros2cli-common-extensions,
  ros2launch,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sros2,
  sros2-cmake,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_core";
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."ros_core";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-cmake-ros ament-index-cpp ament-lint-auto ament-lint-common launch-testing-ament-cmake ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ ament-index-python class-loader common-interfaces launch launch-ros launch-testing launch-testing-ros launch-xml launch-yaml pluginlib rcl-lifecycle rclcpp rclcpp-action rclcpp-lifecycle rclpy ros2cli-common-extensions ros2launch rosidl-default-runtime sros2 sros2-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_core" = substituteSource {
      src = fetchgit {
        name = "ros_core-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "06022325c594d9472bd1d4bd83742196a17adea8";
        hash = "sha256-ZOcPTzdD7/hBxgEOUbw34ZSp6EkK7F1B/cAEaT4lbK8=";
      };
    };
  });
  meta = {
    description = "A package to aggregate the packages required to use publish / subscribe, services, generate messages and other core ROS concepts.";
  };
})
