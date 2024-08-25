{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    event_camera_codecs = substituteSource {
      src = fetchgit {
        name = "event_camera_codecs-source";
        url = "https://github.com/ros2-gbp/event_camera_codecs-release.git";
        rev = "885550d7f26f6df532e74cf11839590c5c8f5564";
        hash = "sha256-Okh/tAcO2MFOTeIVFOE8a+B/bDwyTZeOP6AinyAHjsk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_codecs";
  version = "1.3.5-1";
  src = sources.event_camera_codecs;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader event_camera_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common rclcpp rosbag2_cpp ];
  missingDependencies = [  ];
  meta = {
    description = "package to encode and decode event_camera_msgs";
  };
}
