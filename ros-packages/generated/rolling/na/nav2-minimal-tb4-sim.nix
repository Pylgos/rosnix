{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-minimal-tb4-description,
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
  pname = "nav2_minimal_tb4_sim";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ nav2-minimal-tb4-description robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_sim-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "700d08969ae2363383ea61a0cb3f5f54effa5955";
        hash = "sha256-rQfuepSMdQIJmkfUmcjG45kyVyy1F0+Tz8RlKHKTujc=";
      };
    };
  });
  meta = {
    description = "Nav2 Minimum TurtleBot4 Simulation";
  };
})
