{
  ament-cmake-ros,
  apriltag-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtabmap-msgs,
  rtabmap-sync,
  rtabmap-util,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_slam";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_slam";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ apriltag-msgs cv-bridge geometry-msgs nav2-msgs nav-msgs rclcpp rclcpp-components rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ apriltag-msgs cv-bridge geometry-msgs nav2-msgs nav-msgs rclcpp rclcpp-components rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_slam" = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "6f5318c604c9d1e6c9836843b0cf6066729c3d70";
        hash = "sha256-TeFJEaZeAeTRE3JMnbLIFmoCZfXVaz9Q3Gwbw15+9TA=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's SLAM package.";
  };
})
