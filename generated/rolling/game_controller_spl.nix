{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game_controller_spl_interfaces,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    game_controller_spl = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-source";
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
  src = sources.game_controller_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ game_controller_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
}
