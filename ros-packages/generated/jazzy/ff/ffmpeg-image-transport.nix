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
  version = "1.0.1-2";
  src = finalAttrs.passthru.sources."ffmpeg_image_transport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge ffmpeg-image-transport-msgs image-transport pluginlib rclcpp rcutils sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavdevice-dev" "libogg" "libopencv-imgproc-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ffmpeg_image_transport" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport-release.git";
        rev = "a1a0e2db2352c98dda15d1f0faa9c7d5945306a5";
        hash = "sha256-NNfHNOjQyl6FVnmws3dcgDvUuE+EkIy2CyhFkCqoDNM=";
      };
    };
  });
  meta = {
    description = "ffmpeg_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with ffmpeg.";
  };
})
