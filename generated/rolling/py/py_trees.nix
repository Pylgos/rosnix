{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    py_trees-e91ad9333492fd16fef08eab669c7af78a641b0b = substituteSource {
      src = fetchgit {
        name = "py_trees-e91ad9333492fd16fef08eab669c7af78a641b0b-source";
        url = "https://github.com/ros2-gbp/py_trees-release.git";
        rev = "e91ad9333492fd16fef08eab669c7af78a641b0b";
        hash = "sha256-D4D4KgMpC2gXiPRmmTMkb2IW5rzxXUbEUFu5RVEnaqc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees";
  version = "2.2.1-3";
  src = sources.py_trees-e91ad9333492fd16fef08eab669c7af78a641b0b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pydot" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Pythonic implementation of behaviour trees.";
  };
}
