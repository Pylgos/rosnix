{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_gz_gui_plugins" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_gui_plugins-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "ea801cd26ee4e6ee4181e3c3c3b020fbb50ecffe";
        hash = "sha256-fPdPEFX5PZeLRhZQaUUpHBucllJJpIcF4Xrq4opR848=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_gz_gui_plugins";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_gz_gui_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-gui-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick-extras" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Gazebo Simulator GUI Plugins";
  };
})
