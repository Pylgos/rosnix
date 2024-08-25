{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  camera_info_manager,
  class_loader,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gst_all_1,
  image_transport,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    gscam = substituteSource {
      src = fetchgit {
        name = "gscam-source";
        url = "https://github.com/ros2-gbp/gscam-release.git";
        rev = "9de9e1c8a5353dc48666256b4fbdb77f6cbcfc66";
        hash = "sha256-CKQzdZxZ6OZeWkirhmcrfJhb0hNN0vSimKIRHSUDT3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gscam";
  version = "2.0.2-5";
  src = sources.gscam;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager class_loader cv_bridge gst_all_1.gst-plugins-base gst_all_1.gstreamer image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A ROS camera driver that uses gstreamer to connect to devices such as webcams.";
  };
}
