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
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rtabmap_demos" = substituteSource {
        src = fetchgit {
          name = "rtabmap_demos-source";
          url = "https://github.com/introlab/rtabmap_ros-release.git";
          rev = "b03e98ea5ed3302f06616f751b8b28008f8259dd";
          hash = "sha256-Qc3vsvY2lKUl18v5CqCb2wJYULTdR3yzrxJhreb+Rp8=";
        };
      };
    });
  };
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
})
