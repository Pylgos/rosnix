{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-geometry,
  laser-geometry,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  rtabmap,
  rtabmap-msgs,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_conversions";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_conversions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-geometry laser-geometry pcl-conversions rclcpp rclcpp-components ros-environment rtabmap rtabmap-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-geometry laser-geometry pcl-conversions rclcpp rclcpp-components ros-environment rtabmap rtabmap-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_conversions" = substituteSource {
      src = fetchgit {
        name = "rtabmap_conversions-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "ecee4f8f97d443d8b4dfaf1ba217aeaba1e87959";
        hash = "sha256-37KOhNyy5YUIYIffzqnjWlqdLx53UI+7nlesJl+DRqc=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's conversions package. This package can be used to convert rtabmap_msgs's msgs into RTAB-Map's library objects.";
  };
})
