{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-filter-madgwick,
  mkSourceSet,
  rosSystemPackages,
  rtabmap-odom,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  tf2-ros,
  velodyne,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtabmap_examples";
  version = "0.22.0-1";
  src = finalAttrs.passthru.sources."rtabmap_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ imu-filter-madgwick rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz tf2-ros velodyne ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-filter-madgwick rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz tf2-ros velodyne ];
  passthru.sources = mkSourceSet (sources: {
    "rtabmap_examples" = substituteSource {
      src = fetchgit {
        name = "rtabmap_examples-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "a0834bddb2ac5746c9ffdba25ecc9bd2f9dd613d";
        hash = "sha256-PCkFzYBZlQtrMEomww5T7Zg51xex2KGfOGIJh3zRHwA=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's example launch files.";
  };
})
