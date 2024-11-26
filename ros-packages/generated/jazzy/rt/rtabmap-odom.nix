{
  ament-cmake-ros,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  laser-geometry,
  message-filters,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  pcl-ros,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  rtabmap-sync,
  rtabmap-util,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_odom";
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_odom";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_odom" = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8228b4545c1f1bd89b35e75b76bd67e652811627";
        hash = "sha256-0owvQSXMQlE+Y8M0UBrrHLvgxACHLwndNVXcFYqLy+Q=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's odometry package.";
  };
})
