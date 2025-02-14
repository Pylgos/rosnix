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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_launch";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-msgs rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_launch" = substituteSource {
      src = fetchgit {
        name = "rtabmap_launch-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "f6da4a7a9ed5c248dc665bd2cf603f2603a5a831";
        hash = "sha256-Ws4+/R9/5Dj1nvhkwKK19Bsw4e82iKZWC3pVnXDaK6o=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's main launch files.";
  };
})
