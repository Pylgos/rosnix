{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rtabmap-odom,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_demos";
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_demos" = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "33d8ef14c753832d88818edd653eb39aa0cd2ef5";
        hash = "sha256-MEzmq1wSN/Z2HoMHzzEgK2MC99DTb9oc4F+fNHLlM0Q=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
})
