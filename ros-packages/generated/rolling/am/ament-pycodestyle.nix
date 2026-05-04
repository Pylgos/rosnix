{
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
  pname = "ament_pycodestyle";
  version = "0.20.5-3";
  src = finalAttrs.passthru.sources."ament_pycodestyle";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pycodestyle" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pycodestyle" ]; };
  checkInputs = [ ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1e5258e679925c1fb98bd8f11b08158db75cad61";
        hash = "sha256-7CcK86te4AYGM1HAo95wC5+Z8QJ9W3Zc75POcVClu14=";
      };
    };
  });
  meta = {
    description = "\n    The ability to check code against the style conventions in PEP 8 and\n    generate xUnit test result files.\n  ";
  };
})
