{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  message-filters,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  turtlesim-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtle_tf2_cpp";
  version = "0.6.2-1";
  src = finalAttrs.passthru.sources."turtle_tf2_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch launch-ros message-filters rclcpp tf2 tf2-geometry-msgs tf2-ros turtlesim-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtle_tf2_cpp" = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_cpp-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "bb92fc60658921a5999f0d605be3e4adcbc3ede8";
        hash = "sha256-b1ne7m5Zdgi7/STRiI1TUKoZk6LJLMEfsGsKEKYzIWU=";
      };
    };
  });
  meta = {
    description = "turtle_tf2_cpp demonstrates how to write a ROS2 C++ tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.";
  };
})
