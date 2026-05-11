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
  pname = "ament_pclint";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ce1b953ef42712f1c116ae92ca6d6ca695c88ee5";
        hash = "sha256-3OxEkvewHBBNWaWr7aw0hM3MwhL87OdEhAzTXqIuF/I=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using PC-lint\n    and generate xUnit test result files.\n  ";
  };
})
