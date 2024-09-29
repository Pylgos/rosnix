{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-robot-monitor,
  rviz2,
  substituteSource,
  turtlebot4-description,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_viz" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_viz-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "3c98949db94bbc3bd79210b1ff0d34845105f51d";
        hash = "sha256-2MtFFww8BkKfo7uBYUobASOrm84SlmO1+cfjaghHGVs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot4-viz";
  version = "2.0.1-1";
  src = sources."turtlebot4_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt-robot-monitor rviz2 turtlebot4-description ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Visualization launchers and helpers for Turtlebot4";
  };
}
