{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  camera_calibration_parsers,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  image_transport,
  message_filters,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rclpy,
  rosSystemPackages,
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
        rev = "80080a0e8502142c80195ba5e2389ddf0ce9dce1";
        hash = "sha256-j9Mganqzf50jti2W8E9b2PZAepIFOzUkxNgzcua8Tyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_image_util";
  version = "3.7.3-1";
  src = sources.swri_image_util;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp camera_calibration_parsers cv_bridge geometry_msgs image_geometry image_transport message_filters nav_msgs rclcpp rclcpp_components rclpy std_msgs swri_geometry_util swri_math_util swri_opencv_util swri_roscpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package of commonly image manipulation utilities.";
  };
}
