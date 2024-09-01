{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  pkg-config,
  rclcpp,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_encoder_decoder = substituteSource {
      src = fetchgit {
        name = "ffmpeg_encoder_decoder-source";
        url = "https://github.com/ros2-gbp/ffmpeg_encoder_decoder-release.git";
        rev = "c846ece739ebf7863a745354ee9f3f1c6e897dea";
        hash = "sha256-r++5zahdLLkPS63l7DhrxtFSCYkRWcbI+FPUFA4+kjA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_encoder_decoder";
  version = "1.0.1-1";
  src = sources.ffmpeg_encoder_decoder;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros pkg-config ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge ffmpeg rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "libavdevice-dev" "libopencv-imgproc-dev" ];
  meta = {
    description = "ROS2 convenience wrapper around ffmpeg for encoding/decoding";
  };
}
