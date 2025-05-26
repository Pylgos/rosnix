{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2cli,
  ros2topic,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
  topic-tools-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools";
  version = "1.4.3-1";
  src = finalAttrs.passthru.sources."topic_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli ros2topic rosidl-runtime-py topic-tools-interfaces ];
  buildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli ros2topic rosidl-runtime-py topic-tools-interfaces ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-runtime-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools" = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "14d0a5fb8a7fe736b78dfc6d56c61c97ff30afde";
        hash = "sha256-9sqFxSLn0kwyVjbz8tQjnTYg2ZyL86b8GpuyYz54nxY=";
      };
    };
  });
  meta = {
    description = "\n    Tools for directing, throttling, selecting, and otherwise messing with\n    ROS 2 topics at a meta level.\n  ";
  };
})
