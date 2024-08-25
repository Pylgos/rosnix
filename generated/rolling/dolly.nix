{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  dolly_gazebo,
  dolly_ignition,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly = substituteSource {
      src = fetchgit {
        name = "dolly-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "d421634724723dfbd39e53d934452d59a55e8336";
        hash = "sha256-1ugxemjgNM3QtSsQ64TCZHu8J9gYPS5Qh2s6VRBTiFA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly";
  version = "0.4.0-5";
  src = sources.dolly;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow dolly_gazebo dolly_ignition ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Meta-package for Dolly, the robot sheep.";
  };
}
