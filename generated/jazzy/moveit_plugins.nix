{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_simple_controller_manager,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5141fa4cd1dcf35e61f772376dba2c30930168db";
        hash = "sha256-kPrOE89xIqGfsHcYKSmL7YsJpWCBNDPmdbHY5x0lG1M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_plugins";
  version = "2.10.0-1";
  src = sources.moveit_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_simple_controller_manager ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
}
