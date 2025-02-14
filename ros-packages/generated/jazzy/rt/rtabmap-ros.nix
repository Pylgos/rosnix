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
  version = "0.21.10-1";
  src = finalAttrs.passthru.sources."rtabmap_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rtabmap-conversions rtabmap-demos rtabmap-examples rtabmap-launch rtabmap-msgs rtabmap-odom rtabmap-python rtabmap-rviz-plugins rtabmap-slam rtabmap-sync rtabmap-util rtabmap-viz ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_ros" = substituteSource {
      src = fetchgit {
        name = "rtabmap_ros-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "4a59fba43f1da4179fd3c410e85bdfee77513237";
        hash = "sha256-c95sjrQ4skchoN+agL78+DKkCOPtx0Q4rlZvhXV1txU=";
      };
    };
  });
  meta = {
    description = "RTAB-Map Stack";
  };
})
