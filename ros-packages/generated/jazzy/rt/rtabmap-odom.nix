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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_odom";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_odom" = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "9fce9478c3bf7f19ba85fe251a2ed2fa8eceb7fb";
        hash = "sha256-6kWnVbLAeW5EjIlktb+r7gRP+jzcdH4YqFAnyOzPjL4=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's odometry package.";
  };
})
