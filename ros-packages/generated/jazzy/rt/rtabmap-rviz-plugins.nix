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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pcl-conversions pluginlib rclcpp rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pcl-conversions pluginlib rclcpp rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "7f8e22bb59197c326c1fa18f403bcb2eebffffc8";
        hash = "sha256-YEOMuM7thj2XouHXlp2WeWSehR9rGh7pGwesnMPsaSU=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
})
