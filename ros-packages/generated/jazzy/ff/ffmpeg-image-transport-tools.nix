{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-encoder-decoder,
  ffmpeg-image-transport-msgs,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffmpeg_image_transport_tools";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ cv-bridge ffmpeg-encoder-decoder ffmpeg-image-transport-msgs rclcpp rosbag2-cpp rosbag2-storage sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffmpeg_image_transport_tools" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_tools-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_tools-release.git";
        rev = "92f1f04620bbbc4e800a5d8209dee951ee859ee6";
        hash = "sha256-Zmf1uyLR7szbG77lW736pYMuZpbTgZl4y2e/ZqXfVZY=";
      };
    };
  });
  meta = {
    description = "tools for processing ffmpeg_image_transport_msgs";
  };
})
