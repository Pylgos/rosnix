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
  version = "1.26.40-2";
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
        rev = "65fec2f0c9479c0e6bd587e7e2a3bf97fa32f2c4";
        hash = "sha256-MaKxHJwky/gUM6NI0EK+wfCRTBBaFLHD0clFbss6WnU=";
      };
    };
  });
  meta = {
    description = "GStreamer elements for bidirectional ROS 2 image streaming";
  };
})
