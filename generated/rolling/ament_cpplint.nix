{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1a9a35966d2791c7ac8cd3e08aa1726af66c96e5";
        hash = "sha256-0YP4JcJho6v75+qW4/9zZJvtxUgnUIHkZ+Q8Q1TuYlo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cpplint";
  version = "0.18.1-1";
  src = sources.ament_cpplint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against the Google style conventions using cpplint and generate xUnit test result files.";
  };
}
