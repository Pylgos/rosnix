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
  version = "0.21.5-3";
  src = finalAttrs.passthru.sources."rtabmap_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ imu-filter-madgwick rtabmap-odom rtabmap-rviz-plugins rtabmap-slam rtabmap-util rtabmap-viz tf2-ros velodyne ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rtabmap_examples" = substituteSource {
        src = fetchgit {
          name = "rtabmap_examples-source";
          url = "https://github.com/introlab/rtabmap_ros-release.git";
          rev = "8e54240bb15fee8d600556ea62c159d42c28a742";
          hash = "sha256-Whv9ONhmVWQMEXXoDXnouATtpKTsimj2slZlxGe7Irk=";
        };
      };
    });
  };
  meta = {
    description = "RTAB-Map's example launch files.";
  };
})
