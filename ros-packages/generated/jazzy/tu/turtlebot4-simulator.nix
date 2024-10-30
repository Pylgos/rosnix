{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-gz-bringup,
  turtlebot4-gz-gui-plugins,
  turtlebot4-gz-toolbox,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_simulator" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_simulator-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "b9d0fcfebe9cdb27c655ec53fb8588e80e03ef52";
        hash = "sha256-kM6RAZXLjzh1aVf4aALnvyi3jvwEhRqTC/J9OW1S56Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_simulator";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot4-gz-bringup turtlebot4-gz-gui-plugins turtlebot4-gz-toolbox ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Metapackage for Turtlebot4 simulations";
  };
})
