{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls-lfcd-lds-driver,
  joint-state-publisher,
  joy-linux,
  mkSourceSet,
  nav2-map-server,
  raspimouse,
  raspimouse-description,
  raspimouse-ros2-examples,
  robot-state-publisher,
  rosSystemPackages,
  rplidar-ros,
  rviz2,
  slam-toolbox,
  substituteSource,
  urg-node,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_slam";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_slam";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ hls-lfcd-lds-driver joint-state-publisher joy-linux nav2-map-server raspimouse raspimouse-description raspimouse-ros2-examples robot-state-publisher rplidar-ros rviz2 slam-toolbox urg-node xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver joint-state-publisher joy-linux nav2-map-server raspimouse raspimouse-description raspimouse-ros2-examples robot-state-publisher rplidar-ros rviz2 slam-toolbox urg-node xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_slam" = substituteSource {
      src = fetchgit {
        name = "raspimouse_slam-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "e222cf86d692a20b8daaf53dc53b0b5836f3358c";
        hash = "sha256-8idsCs95or3g+hBvgW1Zaj4n+caVkfXVPrzDXfKba1w=";
      };
    };
  });
  meta = {
    description = "SLAM package for Raspberry Pi Mouse";
  };
})
