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
        rev = "ddcd0aaab591940e89e7099fc8134fa27707d1c3";
        hash = "sha256-GdDuVhfdtVs/Q6ePDhpXnxvCjqgw/b2+/qxwpYJHXk8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.18.1-1";
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
