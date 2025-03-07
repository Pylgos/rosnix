{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_lint_cmake";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_lint_cmake";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3fc981134ac46aeb042d8b45314d95125f9c21ca";
        hash = "sha256-cWsd6T6EZHCvf1Sq4AKa4T06mJtVRx4JmC0SjOXzd3Q=";
      };
    };
  });
  meta = {
    description = "The ability to lint CMake code using cmakelint and generate xUnit test result files.";
  };
})
