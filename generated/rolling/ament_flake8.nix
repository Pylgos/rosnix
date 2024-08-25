{
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
    ament_flake8 = substituteSource {
      src = fetchgit {
        name = "ament_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3810a74bdf9742742999a3cf7c41858535c59641";
        hash = "sha256-+BzTuEDIDPEVwvpwaxXg3hBMvXqYeYdbHR0xfMObWxc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_flake8";
  version = "0.18.1-1";
  src = sources.ament_flake8;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.flake8 buildPackages.python3Packages.flake8-builtins buildPackages.python3Packages.flake8-comprehensions buildPackages.python3Packages.flake8-docstrings buildPackages.python3Packages.flake8-import-order buildPackages.python3Packages.flake8-quotes ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.flake8 python3Packages.flake8-builtins python3Packages.flake8-comprehensions python3Packages.flake8-docstrings python3Packages.flake8-import-order python3Packages.flake8-quotes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code for style and syntax conventions with flake8.";
  };
}
