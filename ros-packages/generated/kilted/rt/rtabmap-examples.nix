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
  version = "0.22.1-1";
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
        rev = "907bb69a0ad511eef690132cac1d969e09d95726";
        hash = "sha256-QlbA2ntA+lMuVGXDlDdMlb2KRWLWi+bf44dOBK+Epns=";
      };
    };
  });
  meta = {
    description = "RTAB-Map's example launch files.";
  };
})
