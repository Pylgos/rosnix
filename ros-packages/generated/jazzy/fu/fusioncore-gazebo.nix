{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fusioncore-ros,
  mkSourceSet,
  nav-msgs,
  rclpy,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_gazebo";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."fusioncore_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ fusioncore-ros nav-msgs rclpy robot-state-publisher ros-gz-bridge ros-gz-sim sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fusioncore-ros nav-msgs rclpy robot-state-publisher ros-gz-bridge ros-gz-sim sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_gazebo" = substituteSource {
      src = fetchgit {
        name = "fusioncore_gazebo-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "1e4765aa55fac27535ecc705576ac160d683f7bd";
        hash = "sha256-b14zbRReiwkkIX6VuSpyx5dR7tBYwGVlBzhJQMckkwE=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation world for FusionCore integration testing";
  };
})
