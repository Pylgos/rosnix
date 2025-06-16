{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  laser-geometry,
  message-filters,
  mkSourceSet,
  nav-msgs,
  octomap-msgs,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_util";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_util";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_util" = substituteSource {
      src = fetchgit {
        name = "rtabmap_util-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "c9770ee30fb7a946d8c3135fa53f8bbb96983796";
        hash = "sha256-FoAiJP9s10R1S69g+E/hKQmmWqth9otiIjNHYlU/E+w=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's various useful nodes and nodelets.";
  };
})
