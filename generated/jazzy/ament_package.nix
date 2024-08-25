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
        rev = "70ffe60211c4feae5e780e5bc95e169d2f79e7ec";
        hash = "sha256-UQTsrOgp2aSxuorO8p8yEInpzIOb5c6+s5Jp1F/FD9c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_package";
  version = "0.16.3-3";
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
