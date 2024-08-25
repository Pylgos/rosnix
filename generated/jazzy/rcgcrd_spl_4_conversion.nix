{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcrd_spl_4,
  substituteSource,
}:
let
  sources = rec {
    rcgcrd_spl_4_conversion = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "1d86fdac4ca8359ad861ed1eff4b9382ca2bac77";
        hash = "sha256-K6SsOmDF2Dk83+uU8ncpvCemrAtVafqT2p8nJLEgu44=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4_conversion";
  version = "4.0.1-1";
  src = sources.rcgcrd_spl_4_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcrd_spl_4 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Converts RoboCup SPL GameController Return Data V4 between ROS msg and UDP raw bytes";
  };
}
