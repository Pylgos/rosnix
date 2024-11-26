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
  pname = "ament_pclint";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "725f2afddf9bf67ccb21defb0b368e4810f3c381";
        hash = "sha256-mzVi+tRmtmtS69433ykdGKWc7EHM0VAGC9f6zdo4teQ=";
      };
    };
  });
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using PC-lint and generate xUnit test result files.";
  };
})
