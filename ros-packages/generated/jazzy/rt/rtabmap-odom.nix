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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_odom";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-geometry laser-geometry message-filters nav-msgs pcl-conversions pcl-ros pluginlib rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_odom" = substituteSource {
      src = fetchgit {
        name = "rtabmap_odom-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "2e9673d292a04cbe4d106149f07f11c4d3f21b23";
        hash = "sha256-zlayMxIOdtOG0AIfkd92ZhkRhv35MUdvap7x+Kcyb9k=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's odometry package.";
  };
})
