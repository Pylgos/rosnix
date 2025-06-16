{
  ament-cmake-ros,
  buildAmentCmakePackage,
  cv-bridge,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  message-filters,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_sync";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_sync";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_sync" = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "1309a49022f8ce3c20d3287bfaefe652cd73919c";
        hash = "sha256-YVc+eovBs/udDfj6FbM5hWBHhwFPyNF5BehCTrYswGw=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
})
