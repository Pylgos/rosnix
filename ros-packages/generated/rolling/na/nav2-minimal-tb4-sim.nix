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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-minimal-tb4-description robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-minimal-tb4-description robot-state-publisher ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_sim" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_sim-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "d479bf9649b618e23f6f9ffb3eade36a6c01b600";
        hash = "sha256-3qK/mpC4qFABFOZ8394cn8i3vnWHM6SMv5tJXGdc0zw=";
      };
    };
  });
  meta = {
    description = "Nav2 Minimum TurtleBot4 Simulation";
  };
})
