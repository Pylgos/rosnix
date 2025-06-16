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
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_demos" = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "075a2bb5826766d2217d8bc1a07cc33ec570f146";
        hash = "sha256-z7LlS8mD5SlH7XwYGOiaxDvj08Ou5I8vnIZ76/mdK1E=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
})
