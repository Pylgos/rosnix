{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport_msgs,
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
    ffmpeg_image_transport = substituteSource {
      src = fetchFromGitHub {
        name = "ffmpeg_image_transport-source";
        owner = "ros2-gbp";
        repo = "ffmpeg_image_transport-release";
        rev = "a1a0e2db2352c98dda15d1f0faa9c7d5945306a5";
        hash = "sha256-NNfHNOjQyl6FVnmws3dcgDvUuE+EkIy2CyhFkCqoDNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport";
  version = "1.0.1-2";
  src = sources.ffmpeg_image_transport;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge ffmpeg_image_transport_msgs image_transport pluginlib rclcpp rcutils sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavdevice-dev" "libogg" "libopencv-imgproc-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ffmpeg_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with ffmpeg.";
  };
}
