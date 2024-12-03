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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_sync";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge diagnostic-updater image-transport message-filters nav-msgs rclcpp rclcpp-components rtabmap-conversions rtabmap-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_sync" = substituteSource {
      src = fetchgit {
        name = "rtabmap_sync-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "a1be03b3ecc845b7e83f5dc4ef63c9b147acf077";
        hash = "sha256-1LzIIKBTjoA0azrKoIWdghWJsoJYWFDmbnATNu2Q6O8=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's synchronization package.";
  };
})
