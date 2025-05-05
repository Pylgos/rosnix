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
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."event_camera_codecs";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ class-loader event-camera-msgs ros-environment ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ class-loader event-camera-msgs ros-environment ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp rosbag2-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "event_camera_codecs" = substituteSource {
      src = fetchgit {
        name = "event_camera_codecs-source";
        url = "https://github.com/ros2-gbp/event_camera_codecs-release.git";
        rev = "ef4d15e31247f27136cb0fa31a91be03301cbe31";
        hash = "sha256-9Eas9XPxZcx9fbTdybVPyqvyW6KEShMM/xaX0xqv+aw=";
      };
    };
  });
  meta = {
    description = "package to encode and decode event_camera_msgs";
  };
})
