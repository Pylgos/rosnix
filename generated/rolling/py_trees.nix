{
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
    py_trees = substituteSource {
      src = fetchgit {
        name = "py_trees-source";
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
  src = sources.py_trees;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pydot ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Pythonic implementation of behaviour trees.";
  };
}
