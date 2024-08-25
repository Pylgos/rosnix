{
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
    ament_package = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "fe52bc6a8cb745137e7d92272d4d1b164c031bce";
        hash = "sha256-86RFBUIc8Ur96L7JYkhpgxQYRCjZ4nLW4RmGH3Rn5go=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_package";
  version = "0.17.1-1";
  src = sources.ament_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.importlib-resources buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.importlib-metadata python3Packages.importlib-resources python3Packages.setuptools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.flake8 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
}
