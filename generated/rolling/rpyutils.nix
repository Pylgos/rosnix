{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rpyutils = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "6695a538e5cba92c66847abb6574eec63aa18c8b";
        hash = "sha256-t72zIwVtVJX3ZymNZ2iOhOwgSN/sycNcRLBiEDjmEag=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rpyutils";
  version = "0.5.0-1";
  src = sources.rpyutils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing various utility types and functions for Python";
  };
}
