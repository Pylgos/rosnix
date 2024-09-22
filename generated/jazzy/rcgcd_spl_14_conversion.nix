{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcgcd_spl_14,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcgcd_spl_14_conversion = substituteSource {
      src = fetchFromGitHub {
        name = "rcgcd_spl_14_conversion-source";
        owner = "ros2-gbp";
        repo = "game_controller_spl-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcgcd_spl_14 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Converts RoboCup SPL GameController Data V14 between ROS msg and UDP raw bytes";
  };
}
