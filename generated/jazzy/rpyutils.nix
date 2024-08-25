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
        rev = "65683d21b74349178a9e518eeac64287dc528127";
        hash = "sha256-irKkZj0IqKDEwaCIh2Rn3jRQmeR3VI8Gkjah0FuSC0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rpyutils";
  version = "0.4.1-3";
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
