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
        rev = "4865eb9b002730f58409ab27dabc50c3efed6cd3";
        hash = "sha256-rtc/wzp1wQPM+3yI94fIAuVRFAfAjqXMWBcyjktb09Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cppcheck";
  version = "0.17.1-1";
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
