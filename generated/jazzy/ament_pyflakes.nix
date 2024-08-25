{
  ament_pycodestyle,
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
    ament_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1862376009b02b5088acb8ac300da55e65394d8a";
        hash = "sha256-KMHU5aqi9tt95GgtqbB7obYtSAUxzWzR/UFQhILKkdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.17.1-1";
  src = sources.ament_pyflakes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyflakes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_pycodestyle python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
}
