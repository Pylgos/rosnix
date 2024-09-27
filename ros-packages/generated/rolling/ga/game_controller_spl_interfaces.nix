{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    game_controller_spl_interfaces-e312374eff005baa120a64812879b7bd36a8f0e0 = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-e312374eff005baa120a64812879b7bd36a8f0e0-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "e312374eff005baa120a64812879b7bd36a8f0e0";
        hash = "sha256-uB8HT6Qzj0QLcmO0XYv5Lw6PpjmowbR2sz0FywtT/6U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "game_controller_spl_interfaces";
  version = "4.0.1-1";
  src = sources.game_controller_spl_interfaces-e312374eff005baa120a64812879b7bd36a8f0e0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
}
