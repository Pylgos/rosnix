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
  ros-environment,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-msgs,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_sync";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_sync";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components ros-environment rtabmap-conversions rtabmap-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_sync" = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "95114f5b9c427f070e0af52143d4c5ec58b46b38";
        hash = "sha256-8UpicHCU9BE1z6GUG2wOVKQAOufHnWaydv+BEp6d5YQ=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
})
