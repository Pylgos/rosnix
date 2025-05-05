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
  foxglove-msgs,
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
  pname = "foxglove_compressed_video_transport";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."foxglove_compressed_video_transport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ ffmpeg-encoder-decoder foxglove-msgs image-transport pluginlib rclcpp rcutils sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ ffmpeg-encoder-decoder foxglove-msgs image-transport pluginlib rclcpp rcutils sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_compressed_video_transport" = substituteSource {
      src = fetchgit {
        name = "foxglove_compressed_video_transport-source";
        url = "https://github.com/ros2-gbp/foxglove_compressed_video_transport-release.git";
        rev = "d624bb78ba5a24990efb4d8417e902543456a5d2";
        hash = "sha256-YoHjnNLKutqI05HZy+qisJ7kqU+jLgiydibojCdjuSE=";
      };
    };
  });
  meta = {
    description = "\n    foxglove_compressed_video_transport provides a plugin to image_transport for\n    transparently sending an image stream encoded in foxglove compressed video packets.\n  ";
  };
})
