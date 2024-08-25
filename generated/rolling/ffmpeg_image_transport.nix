{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  ffmpeg_image_transport_msgs,
  image_transport,
  libogg,
  pkg-config,
  pluginlib,
  rclcpp,
  rcutils,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_image_transport = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport-release.git";
        rev = "a9ce3897ba712754c30d0d8a5da5b90a00b5871e";
        hash = "sha256-NNfHNOjQyl6FVnmws3dcgDvUuE+EkIy2CyhFkCqoDNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport";
  version = "1.0.1-1";
  src = sources.ffmpeg_image_transport;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros pkg-config ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge ffmpeg ffmpeg_image_transport_msgs image_transport libogg pluginlib rclcpp rcutils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ];
  missingDependencies = [ "libavdevice-dev" "libopencv-imgproc-dev" ];
  meta = {
    description = "ffmpeg_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with ffmpeg.";
  };
}
