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
        rev = "f654101da3cf1def189f0c17a520ae92f28798bd";
        hash = "sha256-LVeMfca8EQ5mvYuUo13PqnkllrAvlbUo0VOev/twp4k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_copyright";
  version = "0.17.1-1";
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
