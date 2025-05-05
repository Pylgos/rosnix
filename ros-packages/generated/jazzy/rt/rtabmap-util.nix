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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_util";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ cv-bridge image-transport laser-geometry message-filters nav-msgs octomap-msgs pcl-conversions pcl-ros rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_util" = substituteSource {
      src = fetchgit {
        name = "rtabmap_util-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "78e2ca11e92371eb045d6edd9be9d4a3ae5be83a";
        hash = "sha256-AsRjeh2rGAUlHI1mV182EPBv5GWu8N3mCjoDGDB/sw4=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's various useful nodes and nodelets.";
  };
})
