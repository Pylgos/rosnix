{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  turtlebot4_gz_bringup,
  turtlebot4_gz_gui_plugins,
  turtlebot4_gz_toolbox,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_simulator = substituteSource {
      src = fetchgit {
        name = "turtlebot4_simulator-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "9f21a977c76c3a98a0f5e9795bc5c8d54663bd05";
        hash = "sha256-GU3NXtXUsuX5Ov6HpFEAJ333zqgm9AZyQxAuy1Ym42w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_simulator";
  version = "2.0.0-1";
  src = sources.turtlebot4_simulator;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot4_gz_bringup turtlebot4_gz_gui_plugins turtlebot4_gz_toolbox ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for Turtlebot4 simulations";
  };
}
