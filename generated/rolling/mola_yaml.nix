{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libbase,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_yaml = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "8abda9de83ce48ba234fc5a7585c9b80a36a1604";
        hash = "sha256-p3YPEEi9G6SpJsAtrNR4xqytZdUkO/MfRR/cPkQdoFk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_yaml";
  version = "1.2.0-1";
  src = sources.mola_yaml;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libbase ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "YAML helper library common to MOLA modules";
  };
}
