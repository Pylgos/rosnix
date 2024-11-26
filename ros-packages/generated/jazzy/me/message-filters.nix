{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
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
  version = "4.11.2-1";
  src = finalAttrs.passthru.sources."message_filters";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rclpy rcutils std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto rclcpp-lifecycle sensor-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "message_filters" = substituteSource {
        src = fetchgit {
          name = "message_filters-source";
          url = "https://github.com/ros2-gbp/ros2_message_filters-release.git";
          rev = "634a1472a26a4d1a8d853965887c577ec44341ec";
          hash = "sha256-i48hBMFojn3h3c6DiL0POTYQsjF1N54I7xhDCkNfw5Y=";
        };
      };
    });
  };
  meta = {
    description = "A set of ROS 2 message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met.";
  };
})
