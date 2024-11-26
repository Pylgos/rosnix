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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
  topic-tools-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."topic_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rclpy ros2cli rosidl-runtime-py topic-tools-interfaces ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-runtime-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools" = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "5bdd2702e121ea29198fc5c3cb60d0d0be50a96b";
        hash = "sha256-mHirQripkq5NrQHs53jxTZMqVsMaQlU+DASNQeswXTo=";
      };
    };
  });
  meta = {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS 2 topics at a meta level.";
  };
})
