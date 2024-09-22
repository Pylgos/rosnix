{
  ament_cmake_auto,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  image_proc,
  image_transport,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  message_filters,
  python_cmake_module,
  rclcpp,
  rclcpp_components,
  rclpy,
  rosSystemPackages,
  ros_testing,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    stereo_image_proc = substituteSource {
      src = fetchFromGitHub {
        name = "stereo_image_proc-source";
        owner = "ros2-gbp";
        repo = "image_pipeline-release";
        rev = "c65eff3880ee0bb191ebbeb66427058e9528d8f5";
        hash = "sha256-aMxF8qlqOGJMZrOJiutDrarigoU/MJKYDlnnYhhve2s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_image_proc";
  version = "6.0.3-1";
  src = sources.stereo_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_geometry image_proc image_transport message_filters rclcpp rclcpp_components sensor_msgs stereo_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing launch_testing_ament_cmake python_cmake_module rclpy ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  meta = {
    description = "Stereo and single image rectification and disparity processing.";
  };
}
