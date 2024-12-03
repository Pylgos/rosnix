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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_slam";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs nav-msgs rclcpp rclcpp-components rtabmap-msgs rtabmap-sync rtabmap-util sensor-msgs std-msgs std-srvs tf2 tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_slam" = substituteSource {
      src = fetchgit {
        name = "rtabmap_slam-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "988e2554a71adfdd65778eeef1ff03d212d3836d";
        hash = "sha256-CpXSP3gaOSHYM5gorm4S7GrbDzCIZmIRJuMcB/b/3Vc=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's SLAM package.";
  };
})
