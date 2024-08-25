{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcd_spl_14,
  substituteSource,
}:
let
  sources = rec {
    rcgcd_spl_14_conversion = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "29079b53aeb5d589b4bdd5e36fc343c79b7ac4cf";
        hash = "sha256-vEiB03hHosdjl+RcKMvGYxd7RnFNFQcB7pEearKQX0s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14_conversion";
  version = "4.0.1-1";
  src = sources.rcgcd_spl_14_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcd_spl_14 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Converts RoboCup SPL GameController Data V14 between ROS msg and UDP raw bytes";
  };
}
