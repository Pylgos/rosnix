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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ diff-drive-controller joint-state-broadcaster launch-ros nav2-common nav2-minimal-tb3-sim nav2-minimal-tb4-sim navigation2 ros-gz-bridge ros-gz-sim slam-toolbox xacro ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "38a7076a21fb3244877ee0205b647e88d87691ef";
        hash = "sha256-FKTQfvA39GtbGucOalVs03pU3Js9XEnHtfjS3ycy6wk=";
      };
    };
  });
  meta = {
    description = "Bringup scripts and configurations for the Nav2 stack";
  };
})
