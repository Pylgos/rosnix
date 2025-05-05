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
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."ros_core";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-cmake-ros ament-index-cpp ament-lint-auto ament-lint-common launch-testing-ament-cmake rcl-lifecycle rclcpp rclcpp-lifecycle rclpy ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ ament-index-python class-loader common-interfaces launch launch-ros launch-testing launch-testing-ros launch-xml launch-yaml pluginlib rclcpp-action ros2cli-common-extensions ros2launch rosidl-default-runtime sros2 sros2-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros_core" = substituteSource {
      src = fetchgit {
        name = "ros_core-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "61713444685ea0a036346c4d31763515bbee5971";
        hash = "sha256-2utnBkLdXMgCkKEykzpWEUUFhqXqCTFCUTQ8ivaKTAE=";
      };
    };
  });
  meta = {
    description = "A package to aggregate the packages required to use publish / subscribe, services, generate messages and other core ROS concepts.";
  };
})
