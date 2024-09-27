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
  rclcpp,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_encoder_decoder-d0a55a82d0c309e26dcaef7875ed6407df214807 = substituteSource {
      src = fetchgit {
        name = "ffmpeg_encoder_decoder-d0a55a82d0c309e26dcaef7875ed6407df214807-source";
        url = "https://github.com/ros2-gbp/ffmpeg_encoder_decoder-release.git";
        rev = "d0a55a82d0c309e26dcaef7875ed6407df214807";
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
  src = sources.ffmpeg_encoder_decoder-d0a55a82d0c309e26dcaef7875ed6407df214807;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge rclcpp sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "libavdevice-dev" "libopencv-imgproc-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 convenience wrapper around ffmpeg for encoding/decoding";
  };
}
