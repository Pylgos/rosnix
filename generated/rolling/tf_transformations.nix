{
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    tf_transformations = substituteSource {
      src = fetchgit {
        name = "tf_transformations-source";
        url = "https://github.com/ros2-gbp/tf_transformations_release.git";
        rev = "46e49385caef93d5ce0ac3663e2b26ce83c3ec1b";
        hash = "sha256-ZpntCNRY//B8eLWdIgouelBtxzP77cHw4dIl0MVnAig=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf_transformations";
  version = "1.0.1-4";
  src = sources.tf_transformations;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Reimplementation of the tf/transformations.py library for common Python spatial operations";
  };
}
