{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
        rev = "76b65c1cbeef9b611b2dc132642aa3d5579bf816";
        hash = "sha256-diJhkfZQeAyXVe34WePyUNEVsnqrcllwQ/hNmH0fje8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "turtlebot4_gz_gui_plugins";
  version = "2.0.1-1";
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
