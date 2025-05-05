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
  version = "0.21.10-1";
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
        rev = "d532a7d8dd38fe8b5829c0f48a43e5a7c3816e54";
        hash = "sha256-NIMASuQK5mRL6FIAKjpBAmI1x1UXd4LdpuvDbca+7fI=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's example launch files.";
  };
})
