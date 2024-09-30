{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "foxglove_compressed_video_transport" = substituteSource {
      src = fetchgit {
        name = "foxglove_compressed_video_transport-source";
        url = "https://github.com/ros2-gbp/foxglove_compressed_video_transport-release.git";
        rev = "ac84a01ce5fdeb17d78d38c147e4dbbb42d3a68a";
        hash = "sha256-ru3czXqeURYGh9sqc15zME8C9tUTa6Vkwo8Z7fOkBbc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "foxglove-compressed-video-transport";
  version = "1.0.0-1";
  src = sources."foxglove_compressed_video_transport";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ffmpeg-encoder-decoder foxglove-msgs image-transport pluginlib rclcpp rcutils sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "foxglove_compressed_video_transport provides a plugin to image_transport for transparently sending an image stream encoded in foxglove compressed video packets.";
  };
}