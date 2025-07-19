{
  ament-cmake-ros,
  apriltag-msgs,
  aruco-msgs,
  aruco-opencv-msgs,
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
  ros-environment,
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
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_slam";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ apriltag-msgs aruco-msgs aruco-opencv-msgs cv-bridge geometry-msgs nav2-msgs nav-msgs rclcpp rclcpp-components ros-environment rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ apriltag-msgs aruco-msgs aruco-opencv-msgs cv-bridge geometry-msgs nav2-msgs nav-msgs rclcpp rclcpp-components ros-environment rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_slam" = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "22f337a5498843e36e2f3198458f1f1a65e6f82c";
        hash = "sha256-VPqHsLXxEsnE4/b9LR+VeaXorlEp1fOrHqTYqw7/cY8=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's SLAM package.";
  };
})
