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
    turtlebot4_simulator-357d42fd9caff0b5d70b0dc537f1a05438e749c9 = substituteSource {
      src = fetchgit {
        name = "turtlebot4_simulator-357d42fd9caff0b5d70b0dc537f1a05438e749c9-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "357d42fd9caff0b5d70b0dc537f1a05438e749c9";
        hash = "sha256-gTxddTfu8I+WI6yit3r6L0uWyUtUikY/pckMPHLKJ1k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_simulator";
  version = "2.0.1-1";
  src = sources.turtlebot4_simulator-357d42fd9caff0b5d70b0dc537f1a05438e749c9;
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
