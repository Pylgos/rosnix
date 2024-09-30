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
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "game_controller_spl_interfaces" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "64bc955029e0e7ed74ef442b0ab000b9f8c19963";
        hash = "sha256-uB8HT6Qzj0QLcmO0XYv5Lw6PpjmowbR2sz0FywtT/6U=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "game_controller_spl_interfaces";
  version = "4.0.1-1";
  src = sources."game_controller_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
}
