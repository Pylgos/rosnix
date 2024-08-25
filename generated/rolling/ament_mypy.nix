{
  ament_flake8,
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
    ament_mypy = substituteSource {
      src = fetchgit {
        name = "ament_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "c31f1d8ae9d65d1f0d48429ae9e33c4c2d786657";
        hash = "sha256-R7jHNYuhpeiCE5glxRX9kuYPgQD5j6RoEqbNkX48ivo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_mypy";
  version = "0.18.1-1";
  src = sources.ament_mypy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.mypy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 python3Packages.pytest python3Packages.pytest-mock ];
  missingDependencies = [  ];
  meta = {
    description = "Support for mypy static type checking in ament.";
  };
}
