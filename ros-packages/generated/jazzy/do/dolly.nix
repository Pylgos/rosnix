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
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly-5d847c8aa319f738c369490da961e87b5e408508 = substituteSource {
      src = fetchgit {
        name = "dolly-5d847c8aa319f738c369490da961e87b5e408508-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "5d847c8aa319f738c369490da961e87b5e408508";
        hash = "sha256-1ugxemjgNM3QtSsQ64TCZHu8J9gYPS5Qh2s6VRBTiFA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly";
  version = "0.4.0-6";
  src = sources.dolly-5d847c8aa319f738c369490da961e87b5e408508;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dolly_follow dolly_gazebo dolly_ignition ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta-package for Dolly, the robot sheep.";
  };
}
