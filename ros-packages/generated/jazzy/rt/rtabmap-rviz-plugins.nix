{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_rviz_plugins";
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ pcl-conversions pluginlib rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "1b03c7af5ab4037aee417018b5d4882d8a8efa29";
        hash = "sha256-4pTbU7SEyoNMS+7Dsuj5GzHdIWGl42dm83Sz42ol77M=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
})
