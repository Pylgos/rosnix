{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-encoder-decoder,
  ffmpeg-image-transport-msgs,
  image-transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcutils,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ffmpeg_image_transport";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ ffmpeg-encoder-decoder ffmpeg-image-transport-msgs image-transport pluginlib rclcpp rcutils sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffmpeg_image_transport" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport-release.git";
        rev = "8119d3d7e500c496e84b754c3c3a21b26d4c6193";
        hash = "sha256-/VtFNWwQhOs/VNc+7bpxI6/dGt6smsCxal7BVeN7+dM=";
      };
    };
  });
  meta = {
    description = "ffmpeg_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with ffmpeg.";
  };
})
