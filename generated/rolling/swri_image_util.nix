{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  camera_calibration_parsers,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  image_transport,
  message_filters,
  nav_msgs,
  pkg-config,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclpy,
  std_msgs,
  substituteSource,
  swri_geometry_util,
  swri_math_util,
  swri_opencv_util,
  swri_roscpp,
  tf2,
}:
let
  sources = rec {
    swri_image_util = substituteSource {
      src = fetchgit {
        name = "swri_image_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "ad7a1d61498977bd47d1d95857fdb6a2182e6e4d";
        hash = "sha256-KZLr2L6b9CSpmepsGPkZ6D7FlyM9iUKwg7uPDQxfqK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_image_util";
  version = "3.6.1-2";
  src = sources.swri_image_util;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp camera_calibration_parsers cv_bridge eigen geometry_msgs image_geometry image_transport message_filters nav_msgs python3Packages.boost rclcpp rclcpp_components rclpy std_msgs swri_geometry_util swri_math_util swri_opencv_util swri_roscpp tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "swri_image_util";
  };
}
