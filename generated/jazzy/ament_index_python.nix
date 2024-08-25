{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_index_python = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "86457bacaeec03825e194c05e908a6fb2f9a6061";
        hash = "sha256-7lIMorXGjQYthb0K4PtdrLSyjiRuLQ9ixmanpMqP83Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_index_python";
  version = "1.8.1-1";
  src = sources.ament_index_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python API to access the ament resource index.";
  };
}
