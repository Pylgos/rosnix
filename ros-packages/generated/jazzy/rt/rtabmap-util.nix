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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_util";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_util" = substituteSource {
      src = fetchgit {
        name = "rtabmap_util-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "13cf32de3a25d8032d3a57a8438575d86cb3ff1f";
        hash = "sha256-YdmQPLgINkgod6mO13UHDBkRG9ekw6YxVdjXcrFhRaM=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's various useful nodes and nodelets.";
  };
})
