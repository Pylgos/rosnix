{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  laser_geometry,
  message_filters,
  nav_msgs,
  octomap_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rtabmap_conversions,
  rtabmap_msgs,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_util = substituteSource {
      src = fetchFromGitHub {
        name = "rtabmap_util-source";
        owner = "introlab";
        repo = "rtabmap_ros-release";
        rev = "4b74ac52332dd21c29a0d8f232c6cd8bf8a08d05";
        hash = "sha256-X6MImZAu8fZAHdLZC+BxBb89e/JoJTorg3+YXLtC0ns=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_util";
  version = "0.21.5-3";
  src = sources.rtabmap_util;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_transport laser_geometry message_filters nav_msgs octomap_msgs pcl_conversions pcl_ros rclcpp rclcpp_components rtabmap_conversions rtabmap_msgs sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's various useful nodes and nodelets.";
  };
}
