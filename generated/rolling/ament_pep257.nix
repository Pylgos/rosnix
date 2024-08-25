{
  ament_flake8,
  ament_lint,
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
    ament_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "35c4d5f9407a68a8c593b009cde3f218e1c10962";
        hash = "sha256-chTxLQN/tfn3U6fW5183NTPBn+ftAZzDyDQuGj1tvQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pep257";
  version = "0.18.1-1";
  src = sources.ament_pep257;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.pydocstyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.pydocstyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against the docstring style conventions in PEP 257 and generate xUnit test result files.";
  };
}
