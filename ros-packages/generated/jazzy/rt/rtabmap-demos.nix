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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_demos" = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "1adfa54dbb2d6a4a4f8153226ba92282ee0a620a";
        hash = "sha256-4076hKS/F+xB2CXYDnx+pRPKi90G9pTHxce1cViT004=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
})
