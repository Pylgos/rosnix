{
  ament-cmake-ros,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_slam";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp-components rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_slam" = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "d25cb81da6d96ca61523b84c040acfb8671aa80a";
        hash = "sha256-Gi8sYmDCRDZ9PF42Dve4hKjdU2YJTe8jM80lY8hHIWY=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's SLAM package.";
  };
})
