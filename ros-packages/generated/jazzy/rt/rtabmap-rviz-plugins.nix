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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ pcl-conversions pluginlib rclcpp rtabmap-conversions rtabmap-msgs rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "rtabmap_rviz_plugins-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "591be4beecc6b0fff4030dfc9cc2e397046b3af5";
        hash = "sha256-dQKKgVeE2g3FjoIzdlCA3C4cIeizszZbxZ0LFvVQKwU=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's rviz plugins.";
  };
})
