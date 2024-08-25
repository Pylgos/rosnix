{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  cppcheck,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cppcheck = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9edd3b221e520812c71d1a6f7618c7935e1bade3";
        hash = "sha256-rzEn4wrykS30AoLSNj/AE0mFJLKHBMnWSg8p6G5N0Nk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cppcheck";
  version = "0.18.1-1";
  src = sources.ament_cppcheck;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cppcheck ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppcheck ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_pycodestyle python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using Cppcheck and generate xUnit test result files.";
  };
}
