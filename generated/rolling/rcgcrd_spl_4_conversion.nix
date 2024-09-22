{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcgcrd_spl_4,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rcgcrd_spl_4_conversion = substituteSource {
      src = fetchFromGitHub {
        name = "rcgcrd_spl_4_conversion-source";
        owner = "ros2-gbp";
        repo = "game_controller_spl-release";
        rev = "e8f9b909d0d6f31357299651b044ad6d3751126f";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcgcrd_spl_4 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Converts RoboCup SPL GameController Return Data V4 between ROS msg and UDP raw bytes";
  };
}
