{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag_detector,
  apriltag_mit,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "apriltag_detector_mit" = substituteSource {
      src = fetchgit {
        name = "apriltag_detector_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "5b47a9cbec7e3904b6ff541fc76cb84a879d0508";
        hash = "sha256-0C65s0/xg+lK2/3WJVm2MojLHScinQMYax6bEzFIZ64=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "apriltag_detector_mit";
  version = "2.0.0-1";
  src = sources."apriltag_detector_mit";
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ apriltag_detector apriltag_mit apriltag_msgs cv_bridge image_transport pluginlib rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS package for apriltag detection with MIT detector";
  };
}
