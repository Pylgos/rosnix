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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb3_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb3_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb3_sim-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "54c4b2648499e75baf33be986998e108f50d6490";
        hash = "sha256-ooAXS+KL4tKLDGNN5Esp22qX9t3i+RPs0BYlWK40mng=";
      };
    };
  });
  meta = {
    description = "Nav2 Minimum TurtleBot3 Simulation";
  };
})
