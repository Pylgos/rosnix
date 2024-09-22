{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
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
    game_controller_spl = substituteSource {
      src = fetchFromGitHub {
        name = "game_controller_spl-source";
        owner = "ros2-gbp";
        repo = "game_controller_spl-release";
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
  src = sources.game_controller_spl;
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
