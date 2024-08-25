{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_lifecycle,
  rcpputils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    camera_info_manager = substituteSource {
      src = fetchgit {
        name = "camera_info_manager-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "0b086b5ef41dc07dc764a3fad18f09cd87471ddb";
        hash = "sha256-YJtJO7eYICc27OtvRhSpPS9mad8FOcRp97czmEdAzjY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_info_manager";
  version = "5.1.4-1";
  src = sources.camera_info_manager;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp camera_calibration_parsers rclcpp rclcpp_lifecycle rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides a C++ interface for camera calibration information. It provides CameraInfo, and handles SetCameraInfo service requests, saving and restoring the camera calibration data.";
  };
}
