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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_conversions";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-geometry laser-geometry pcl-conversions rclcpp rclcpp-components rtabmap rtabmap-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_conversions" = substituteSource {
      src = fetchgit {
        name = "rtabmap_conversions-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "9a11c4d1b233e1373da1bbb51dbe74bfa19708f9";
        hash = "sha256-Y6VNn6+Gj6M39PsmYhvkeORZpewdCirondIeyugIelw=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's conversions package. This package can be used to convert rtabmap_msgs's msgs into RTAB-Map's library objects.";
  };
})
