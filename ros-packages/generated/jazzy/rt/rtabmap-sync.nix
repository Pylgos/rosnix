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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_sync";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_sync" = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "b9b85c864e19074f527b76aef40d97e692af1fb9";
        hash = "sha256-+kA4IKzjegk33Vyk2+eI+k3ZbaDKvR1RriigjMmNeVU=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
})
