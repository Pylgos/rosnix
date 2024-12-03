{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rtabmap-msgs,
  rtabmap-odom,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_launch";
  version = "0.21.9-1";
  src = finalAttrs.passthru.sources."rtabmap_launch";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-msgs rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_launch" = substituteSource {
      src = fetchgit {
        name = "rtabmap_launch-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "b6c03d0e59708db8f347b0ce79ec514f97bd7b57";
        hash = "sha256-8POColsLwC4wLNdjEyRix76o4cmv6EoBZM9beK4IHgA=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's main launch files.";
  };
})
