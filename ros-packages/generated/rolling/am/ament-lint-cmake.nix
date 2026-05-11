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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_lint_cmake";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "136b1f64b6c7695d4e32f7e34d477067701326fa";
        hash = "sha256-SGwpwmXZb5NLhmGXXp+9k8TU5SKjCEQnH7vB4M7guto=";
      };
    };
  });
  meta = {
    description = "\n    The ability to lint CMake code using cmakelint and generate xUnit test\n    result files.\n  ";
  };
})
