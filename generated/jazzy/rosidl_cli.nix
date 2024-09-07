{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
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
    rosidl_cli = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f3fbc3dcadb5ca306407c31fbaa0ecba83986182";
        hash = "sha256-a0EE0q4GAoNQ7F0z3KQISmIiLZmDH99iv1fTzIfIwCA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cli";
  version = "4.6.4-1";
  src = sources.rosidl_cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.argcomplete python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Command line tools for ROS interface generation.";
  };
}
