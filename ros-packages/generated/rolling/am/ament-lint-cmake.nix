{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
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
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_lint_cmake";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a3a3020730bc4e3cc35d093fa86018207e715afb";
        hash = "sha256-xDjb1r9BOLzgDDCSGKBTXMy4YbFgHcW+HZm/wCqeHQE=";
      };
    };
  });
  meta = {
    description = "\n    The ability to lint CMake code using cmakelint and generate xUnit test\n    result files.\n  ";
  };
})
