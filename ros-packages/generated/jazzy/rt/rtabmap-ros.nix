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
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-conversions rtabmap-demos rtabmap-examples rtabmap-launch rtabmap-msgs rtabmap-odom rtabmap-python rtabmap-rviz-plugins rtabmap-slam rtabmap-sync rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_ros" = substituteSource {
      src = fetchgit {
        name = "rtabmap_ros-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "f4f399bb8f0f0e15ed74d2b4c9e596633178df91";
        hash = "sha256-sMFefNXQw701wi8p03MYF81MfgY2rHT+P09FVH/7Y1k=";
      };
    };
  });
  meta = {
    description = "RTAB-Map Stack";
  };
})
