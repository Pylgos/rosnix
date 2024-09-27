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
  rosSystemPackages,
  ros_environment,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    event_camera_codecs-ef4d15e31247f27136cb0fa31a91be03301cbe31 = substituteSource {
      src = fetchgit {
        name = "event_camera_codecs-ef4d15e31247f27136cb0fa31a91be03301cbe31-source";
        url = "https://github.com/ros2-gbp/event_camera_codecs-release.git";
        rev = "ef4d15e31247f27136cb0fa31a91be03301cbe31";
        hash = "sha256-9Eas9XPxZcx9fbTdybVPyqvyW6KEShMM/xaX0xqv+aw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_codecs";
  version = "1.0.5-1";
  src = sources.event_camera_codecs-ef4d15e31247f27136cb0fa31a91be03301cbe31;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader event_camera_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_gtest ament_lint_auto ament_lint_common rclcpp rosbag2_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "package to encode and decode event_camera_msgs";
  };
}
