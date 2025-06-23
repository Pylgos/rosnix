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
  version = "0.20.1-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "5f986b9ffec660b3dd031d02c6c2e8338bb795b2";
        hash = "sha256-ZTQYXRHeBf4lvM+dttbvmRIUGHuOh/DBBNdE17fALmU=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using PC-lint\n    and generate xUnit test result files.\n  ";
  };
})
