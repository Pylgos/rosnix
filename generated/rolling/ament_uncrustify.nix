{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  uncrustify_vendor,
}:
let
  sources = rec {
    ament_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "0fb194f168f8ae2750d87f3a9033d0e89417c6a6";
        hash = "sha256-nMC+VH4jmPDZMgJ61eMO71gQieezRJ3jP2cLpV7MDaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_uncrustify";
  version = "0.18.1-1";
  src = sources.ament_uncrustify;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ uncrustify_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ uncrustify_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_pycodestyle python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against style conventions using uncrustify and generate xUnit test result files.";
  };
}
