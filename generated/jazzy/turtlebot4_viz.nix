{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_robot_monitor,
  rviz2,
  substituteSource,
  turtlebot4_description,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_viz = substituteSource {
      src = fetchFromGitHub {
        name = "turtlebot4_viz-source";
        owner = "ros2-gbp";
        repo = "turtlebot4_desktop-release";
        rev = "a41ed5144a04782c1a256321e4f89543633593c3";
        hash = "sha256-B4JLIzBiGpHseRRlnfEuWpihIRHG23dlmrp7JTRELrI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_viz";
  version = "2.0.0-1";
  src = sources.turtlebot4_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_robot_monitor rviz2 turtlebot4_description ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Visualization launchers and helpers for Turtlebot4";
  };
}
