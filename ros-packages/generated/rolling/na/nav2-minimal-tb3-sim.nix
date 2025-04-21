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
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."nav2_minimal_tb3_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb3_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb3_sim-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "536186307241e7339f015148c46e16bc7385c41a";
        hash = "sha256-iOnfVR8gK5yYGNe5eBxlIgdlzODPrIW3YP3gffJ22/I=";
      };
    };
  });
  meta = {
    description = "Nav2 Minimum TurtleBot3 Simulation";
  };
})
