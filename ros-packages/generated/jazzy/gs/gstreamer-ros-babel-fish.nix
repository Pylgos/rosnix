{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gstreamer_ros_babel_fish";
  version = "1.26.40-1";
  src = finalAttrs.passthru.sources."gstreamer_ros_babel_fish";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gstreamer1.0" "gstreamer1.0-plugins-base" "gstreamer1.0-plugins-good" "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gstreamer1.0" "gstreamer1.0-plugins-base" "gstreamer1.0-plugins-good" "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "gstreamer_ros_babel_fish" = substituteSource {
      src = fetchgit {
        name = "gstreamer_ros_babel_fish-source";
        url = "https://github.com/ros2-gbp/gstreamer_ros_babel_fish-release.git";
        rev = "dcff5dc1ae0de80eb17af187a2a7b407de3e145b";
        hash = "sha256-MaKxHJwky/gUM6NI0EK+wfCRTBBaFLHD0clFbss6WnU=";
      };
    };
  });
  meta = {
    description = "GStreamer elements for bidirectional ROS 2 image streaming";
  };
})
