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
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_sync";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_sync" = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "0fb73881a470a5bc34724c36330ba679d5655975";
        hash = "sha256-13lwERfEWg8Suvpcc8KG0N2uR4sc0sQDx/ez9ejfXRI=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
})
