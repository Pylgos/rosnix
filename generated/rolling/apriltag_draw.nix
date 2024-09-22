{
  ament_cmake,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    apriltag_draw = substituteSource {
      src = fetchFromGitHub {
        name = "apriltag_draw-source";
        owner = "ros2-gbp";
        repo = "apriltag_detector-release";
        rev = "4294d5688ed3a8f5d236d28e07ebcd4ea332c655";
        hash = "sha256-LhikKz6PgCFGTywR7Hc1qY8jmcv7KgauD9TWIvXZDBc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_draw";
  version = "2.0.0-1";
  src = sources.apriltag_draw;
  nativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ apriltag_msgs cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS package for drawing apriltags on image";
  };
}
