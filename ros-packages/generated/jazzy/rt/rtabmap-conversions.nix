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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_conversions";
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_conversions";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-geometry laser-geometry pcl-conversions rclcpp rclcpp-components ros-environment rtabmap rtabmap-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-geometry laser-geometry pcl-conversions rclcpp rclcpp-components ros-environment rtabmap rtabmap-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_conversions" = substituteSource {
      src = fetchgit {
        name = "rtabmap_conversions-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "7dabbf79b9f4ae428003dcbe0595374ca5a0bfb8";
        hash = "sha256-Fc/07MeBu52GzU5om4rmpS11rbCPE/lBtwpRLcsjGXY=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's conversions package. This package can be used to convert rtabmap_msgs's msgs into RTAB-Map's library objects.";
  };
})
