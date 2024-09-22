{
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tf_transformations = substituteSource {
      src = fetchFromGitHub {
        name = "tf_transformations-source";
        owner = "ros2-gbp";
        repo = "tf_transformations_release";
        rev = "c623ec1a59d1afc184a119057bd42cba948a1722";
        hash = "sha256-ojeOIsR7yaPVDfd/6N3cPt6MShybAcLZlBQWNpOt64g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf_transformations";
  version = "1.1.0-1";
  src = sources.tf_transformations;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Reimplementation of the tf/transformations.py library for common Python spatial operations";
  };
}
