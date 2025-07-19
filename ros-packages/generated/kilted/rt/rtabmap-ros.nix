{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-demos,
  rtabmap-examples,
  rtabmap-launch,
  rtabmap-msgs,
  rtabmap-odom,
  rtabmap-python,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-sync,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_ros";
  version = "0.22.1-1";
  src = finalAttrs.passthru.sources."rtabmap_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rtabmap-conversions rtabmap-demos rtabmap-examples rtabmap-launch rtabmap-msgs rtabmap-odom rtabmap-python rtabmap-rviz-plugins rtabmap-slam rtabmap-sync rtabmap-util rtabmap-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rtabmap-conversions rtabmap-demos rtabmap-examples rtabmap-launch rtabmap-msgs rtabmap-odom rtabmap-python rtabmap-rviz-plugins rtabmap-slam rtabmap-sync rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_ros" = substituteSource {
      src = fetchgit {
        name = "rtabmap_ros-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "ec7c7e2662ea6a9a2ea7385d7543a41e194deedb";
        hash = "sha256-BgmxgE6ui7YAK6eNIqEaaE6+0gtOdmno5+9l6O/Bz90=";
      };
    };
  });
  meta = {
    description = "\n    RTAB-Map Stack\n  ";
  };
})
