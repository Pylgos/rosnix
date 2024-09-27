{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_lint_cmake-1bfad5debe6c0c70376facc7ab736358fc63a486 = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-1bfad5debe6c0c70376facc7ab736358fc63a486-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1bfad5debe6c0c70376facc7ab736358fc63a486";
        hash = "sha256-EXPTAP6B7Ff/MfIJ/H6ye2h/1ZJFEQ8TInEDBLWscVQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_cmake";
  version = "0.18.1-1";
  src = sources.ament_lint_cmake-1bfad5debe6c0c70376facc7ab736358fc63a486;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to lint CMake code using cmakelint and generate xUnit test result files.";
  };
}
