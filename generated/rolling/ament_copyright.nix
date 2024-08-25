{
  ament_flake8,
  ament_lint,
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
    ament_copyright = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9c1b98cd1e76b37c38eb9bbe6a283b53c417917d";
        hash = "sha256-NEzyvUfgHAK7h3avlhpUj0AKLCsg2Yckk1fWbNOjhxo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_copyright";
  version = "0.18.1-1";
  src = sources.ament_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check source files for copyright and license information.";
  };
}
