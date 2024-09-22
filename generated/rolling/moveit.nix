{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros,
  moveit_setup_assistant,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fd43888020f2982d6d1f2aa2c59cf6ae1f8ea6b7";
        hash = "sha256-QfIpoMDwo0hdRuwSNJRJR2bamYKWHEY/i398nhoI27g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit";
  version = "2.11.0-1";
  src = sources.moveit;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros moveit_setup_assistant ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
}
