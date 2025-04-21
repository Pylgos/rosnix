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
  version = "0.19.2-1";
  src = finalAttrs.passthru.sources."ament_lint_cmake";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_cmake" = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "734f6f8ceb5626c8190978ca7d3053cf39a882f0";
        hash = "sha256-kqNs/BF+U6I7q/y8TYv7LELt4XzAGpkYUlZ6L922ELk=";
      };
    };
  });
  meta = {
    description = "The ability to lint CMake code using cmakelint and generate xUnit test result files.";
  };
})
