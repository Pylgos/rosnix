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
  version = "0.19.2-2";
  src = finalAttrs.passthru.sources."ament_pclint";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pclint" = substituteSource {
      src = fetchgit {
        name = "ament_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ce76d4de54826a09f3fea9cf617876066ea1007c";
        hash = "sha256-RKu9k/2RFB1tOBd4ZL/fOUR+9SoOiMri05zgPPf9/Uc=";
      };
    };
  });
  meta = {
    description = "\n    The ability to perform static code analysis on C/C++ code using PC-lint\n    and generate xUnit test result files.\n  ";
  };
})
