{
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl_conversions,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rtabmap_conversions,
  rtabmap_msgs,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_rviz_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "rtabmap_rviz_plugins-source";
        owner = "introlab";
        repo = "rtabmap_ros-release";
        rev = "750b6e20a84a8b219576070925f9b702f747fd0f";
        hash = "sha256-Ym++aQZELnnolLYuvqRmWnuNRIB8vXO01qD/f8m1obs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_rviz_plugins";
  version = "0.21.5-3";
  src = sources.rtabmap_rviz_plugins;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pcl_conversions pluginlib rclcpp rtabmap_conversions rtabmap_msgs rviz_common rviz_default_plugins rviz_rendering sensor_msgs std_msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
}
