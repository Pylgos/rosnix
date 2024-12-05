{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls-lfcd-lds-driver,
  mkSourceSet,
  nav2-bringup,
  raspimouse,
  raspimouse-slam,
  rosSystemPackages,
  rplidar-ros,
  rviz2,
  substituteSource,
  urg-node,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_navigation";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_navigation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver nav2-bringup raspimouse raspimouse-slam rplidar-ros rviz2 urg-node ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_navigation" = substituteSource {
      src = fetchgit {
        name = "raspimouse_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "67a046563e45d6420f7337b44a403a487f3fc1d6";
        hash = "sha256-2JqPyOFLKTMSPG7KgDW/R9i+EQ49IVlxACCesRCpdy8=";
      };
    };
  });
  meta = {
    description = "Navigation package for Raspberry Pi Mouse";
  };
})
