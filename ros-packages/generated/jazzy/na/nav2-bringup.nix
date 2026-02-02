{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav2-common,
  nav2-minimal-tb3-sim,
  nav2-minimal-tb4-sim,
  navigation2,
  ros-gz-bridge,
  ros-gz-sim,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_bringup";
  version = "1.3.11-1";
  src = finalAttrs.passthru.sources."nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ diff-drive-controller joint-state-broadcaster launch-ros nav2-common nav2-minimal-tb3-sim nav2-minimal-tb4-sim navigation2 ros-gz-bridge ros-gz-sim slam-toolbox xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diff-drive-controller joint-state-broadcaster launch-ros nav2-common nav2-minimal-tb3-sim nav2-minimal-tb4-sim navigation2 ros-gz-bridge ros-gz-sim slam-toolbox xacro ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d4564c5d09e92651c30599ae301f8ae2a3360fa5";
        hash = "sha256-0mNy87dORAkfaCtR8zjuRxNHrAIMBOySFUt1sXdyC6s=";
      };
    };
  });
  meta = {
    description = "Bringup scripts and configurations for the Nav2 stack";
  };
})
