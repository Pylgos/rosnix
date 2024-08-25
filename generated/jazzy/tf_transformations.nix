{
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tf_transformations = substituteSource {
      src = fetchgit {
        name = "tf_transformations-source";
        url = "https://github.com/ros2-gbp/tf_transformations_release.git";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [ "python3-transforms3d" ];
  meta = {
    description = "Reimplementation of the tf/transformations.py library for common Python spatial operations";
  };
}
