{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_robot_monitor,
  rviz2,
  substituteSource,
  turtlebot4_description,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_viz = substituteSource {
      src = fetchgit {
        name = "turtlebot4_viz-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_robot_monitor rviz2 turtlebot4_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Visualization launchers and helpers for Turtlebot4";
  };
}
