{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  laser_geometry,
  pcl_conversions,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  rtabmap,
  rtabmap_msgs,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_conversions = substituteSource {
      src = fetchgit {
        name = "rtabmap_conversions-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "1c80b042346259ac95789f3c2ab2fa03ee3e1df9";
        hash = "sha256-dEGeaZyM+ar3xkk16/dwV+D6Ms6mJyf8IFNTI1wDkMY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_conversions";
  version = "0.21.5-3";
  src = sources.rtabmap_conversions;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_geometry laser_geometry pcl_conversions rclcpp rclcpp_components rtabmap rtabmap_msgs sensor_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's conversions package. This package can be used to convert rtabmap_msgs's msgs into RTAB-Map's library objects.";
  };
}
