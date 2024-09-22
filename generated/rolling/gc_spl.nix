{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gc_spl_interfaces,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gc_spl = substituteSource {
      src = fetchFromGitHub {
        name = "gc_spl-source";
        owner = "ros2-gbp";
        repo = "game_controller_spl-release";
        rev = "7db7532c5833d2fd25edbad3bf25ebcf77a64a45";
        hash = "sha256-kZmdkalxnRdGGdrKhvxICSX3XNubLGW9lgzSf1zTjys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl";
  version = "4.0.1-1";
  src = sources.gc_spl;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gc_spl_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
}
