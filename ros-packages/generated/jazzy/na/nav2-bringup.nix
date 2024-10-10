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
let
  sources = mkSourceSet (sources: {
    "nav2_bringup" = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3ed52d2e3b71b48b5f0141e0c4475baf17770d08";
        hash = "sha256-Deg2qAY6VvKeHrjquPFWHy8FbL6BRP3LR1hQWoJsHNk=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_bringup";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."nav2_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diff-drive-controller joint-state-broadcaster launch-ros nav2-common nav2-minimal-tb3-sim nav2-minimal-tb4-sim navigation2 ros-gz-bridge ros-gz-sim slam-toolbox xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Bringup scripts and configurations for the Nav2 stack";
  };
})
