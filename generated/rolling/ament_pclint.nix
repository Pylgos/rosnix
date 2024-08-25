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
    ament_pclint = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8528eae1a994af8f534563cf0c33183ea82ea31d";
        hash = "sha256-bYw3jnkJZaKw5R+nGt/LUb3AKpSBsQ/PWSGQjqZERuc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pclint";
  version = "0.18.1-1";
  src = sources.ament_pclint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using PC-lint and generate xUnit test result files.";
  };
}
