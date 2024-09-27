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
    ament_lint_cmake-3fc981134ac46aeb042d8b45314d95125f9c21ca = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-3fc981134ac46aeb042d8b45314d95125f9c21ca-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3fc981134ac46aeb042d8b45314d95125f9c21ca";
        hash = "sha256-cWsd6T6EZHCvf1Sq4AKa4T06mJtVRx4JmC0SjOXzd3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_cmake";
  version = "0.17.1-1";
  src = sources.ament_lint_cmake-3fc981134ac46aeb042d8b45314d95125f9c21ca;
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
