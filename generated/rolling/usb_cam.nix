{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  camera_info_manager,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  image_transport_plugins,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    usb_cam = substituteSource {
      src = fetchFromGitHub {
        name = "usb_cam-source";
        owner = "ros2-gbp";
        repo = "usb_cam-release";
        rev = "79f51e3c7a3a08ee6534de69366d437c7bd41904";
        hash = "sha256-D4YStPBN+X8H0h6dWlVYgxuLYH5T7XWoyN0zLV5xN2E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "usb_cam";
  version = "0.8.1-1";
  src = sources.usb_cam;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces camera_info_manager cv_bridge image_transport image_transport_plugins rclcpp rclcpp_components rosidl_default_runtime sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" "v4l-utils" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A ROS Driver for V4L USB Cameras";
  };
}
