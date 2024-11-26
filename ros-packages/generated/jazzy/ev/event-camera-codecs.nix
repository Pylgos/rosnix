{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  event-camera-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "event_camera_codecs";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."event_camera_codecs";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ class-loader event-camera-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp rosbag2-cpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "event_camera_codecs" = substituteSource {
        src = fetchgit {
          name = "event_camera_codecs-source";
          url = "https://github.com/ros2-gbp/event_camera_codecs-release.git";
          rev = "885550d7f26f6df532e74cf11839590c5c8f5564";
          hash = "sha256-Okh/tAcO2MFOTeIVFOE8a+B/bDwyTZeOP6AinyAHjsk=";
        };
      };
    });
  };
  meta = {
    description = "package to encode and decode event_camera_msgs";
  };
})
