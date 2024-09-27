{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_encoder_decoder,
  foxglove_msgs,
  image_transport,
  pluginlib,
  rclcpp,
  rcutils,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    foxglove_compressed_video_transport-34efcc0932b3c09d09aecd8e1cea456c8f0b6274 = substituteSource {
      src = fetchgit {
        name = "foxglove_compressed_video_transport-34efcc0932b3c09d09aecd8e1cea456c8f0b6274-source";
        url = "https://github.com/ros2-gbp/foxglove_compressed_video_transport-release.git";
        rev = "34efcc0932b3c09d09aecd8e1cea456c8f0b6274";
        hash = "sha256-ru3czXqeURYGh9sqc15zME8C9tUTa6Vkwo8Z7fOkBbc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_compressed_video_transport";
  version = "1.0.0-1";
  src = sources.foxglove_compressed_video_transport-34efcc0932b3c09d09aecd8e1cea456c8f0b6274;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ffmpeg_encoder_decoder foxglove_msgs image_transport pluginlib rclcpp rcutils sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "foxglove_compressed_video_transport provides a plugin to image_transport for transparently sending an image stream encoded in foxglove compressed video packets.";
  };
}
