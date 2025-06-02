{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_minimal_tb3_sim";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb3_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb3_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb3_sim-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "fff70463834cf145331993a974ee68d4a33b401b";
        hash = "sha256-I4p3vfRKGavMuVvlrC8nRV3vZzN9tkrazAz/GYJ9fdo=";
      };
    };
  });
  meta = {
    description = "Nav2 Minimum TurtleBot3 Simulation";
  };
})
