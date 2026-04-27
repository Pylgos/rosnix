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
  version = "0.2.0-1";
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
        rev = "612395243172c327a6049afbef6bf006abb83f40";
        hash = "sha256-pzs8ZB2NDNZoJ+4iDLruY6a/XTHjdPxULZZDAGtu49Q=";
      };
    };
  });
  meta = {
    description = "Gazebo simulation world for FusionCore integration testing";
  };
})
