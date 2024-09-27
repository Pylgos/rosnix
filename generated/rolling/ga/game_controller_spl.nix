{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game_controller_spl_interfaces,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    game_controller_spl-0df9a750b7eb24371f5f828dd89cf6472e5bfc7f = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-0df9a750b7eb24371f5f828dd89cf6472e5bfc7f-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "0df9a750b7eb24371f5f828dd89cf6472e5bfc7f";
        hash = "sha256-FvjsH3PKrQtxsZS4hXMelGbnTjvs6W2JjiYn6WevoWA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "game_controller_spl";
  version = "4.0.1-1";
  src = sources.game_controller_spl-0df9a750b7eb24371f5f828dd89cf6472e5bfc7f;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ game_controller_spl_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
}
