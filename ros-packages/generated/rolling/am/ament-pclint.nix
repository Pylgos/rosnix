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
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "427de12070266d2df92dabed5b3f5028205738c1";
        hash = "sha256-2a4NCog2Be4tGTpzTBMgNqoS7bSWoEmDP8PrpBweoY8=";
      };
    };
  });
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using PC-lint and generate xUnit test result files.";
  };
})
