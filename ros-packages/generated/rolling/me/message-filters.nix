{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "message_filters";
  version = "7.0.2-1";
  src = finalAttrs.passthru.sources."message_filters";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rclpy rcutils std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp-lifecycle sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "message_filters" = substituteSource {
      src = fetchgit {
        name = "message_filters-source";
        url = "https://github.com/ros2-gbp/ros2_message_filters-release.git";
        rev = "747b657064f07b3a553bd6a5a76e452221e6f970";
        hash = "sha256-BWJ6rAR5/2t1JE69TZGA5LaeeoemmpbhKPDeyQyxbss=";
      };
    };
  });
  meta = {
    description = "A set of ROS 2 message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met.";
  };
})
