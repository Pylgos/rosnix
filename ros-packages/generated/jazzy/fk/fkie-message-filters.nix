{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fkie_message_filters";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."fkie_message_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-ros rclcpp-lifecycle std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fkie_message_filters" = substituteSource {
      src = fetchgit {
        name = "fkie_message_filters-source";
        url = "https://github.com/ros2-gbp/fkie_message_filters-release.git";
        rev = "d52ffb5bedc81a3c86f315ca8b88b6a2d591c6ad";
        hash = "sha256-YFRWTTlLJDojA6tiYb7kDG22lSpXjsp4VxOjL3WB5HY=";
      };
    };
  });
  meta = {
    description = "Improved ROS message filters";
  };
})
