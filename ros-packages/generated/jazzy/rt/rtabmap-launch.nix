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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_launch";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rtabmap-msgs rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rtabmap-msgs rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_launch" = substituteSource {
      src = fetchgit {
        name = "rtabmap_launch-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "4a444c58fcbb9c5bedd4f3a47e0095106d64ca6d";
        hash = "sha256-pFeNKuxrMJJAs8f75tjWP3o5/jK4AIJrFzXDRxn1wnk=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's main launch files.";
  };
})
