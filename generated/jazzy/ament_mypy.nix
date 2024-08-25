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
        rev = "ee3cc105753726632d19cc5772a9ad3ca859010b";
        hash = "sha256-hM3pes968NZW++cG6X/0jH3kUejkInacRxaXCI3p994=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_mypy";
  version = "0.17.1-1";
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
