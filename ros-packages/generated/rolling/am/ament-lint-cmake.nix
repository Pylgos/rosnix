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
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."ament_lint_cmake";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9f70503bdd3c0a781efc46f8ca7051874a0bd3ab";
        hash = "sha256-9UJ9FA87N8kIazbVPTD3CPfLf2vUK8Vo2OAt0gBOUNc=";
      };
    };
  });
  meta = {
    description = "\n    The ability to lint CMake code using cmakelint and generate xUnit test\n    result files.\n  ";
  };
})
