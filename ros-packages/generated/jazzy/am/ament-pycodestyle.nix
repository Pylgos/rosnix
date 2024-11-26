{
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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_pycodestyle";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pycodestyle" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pycodestyle" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6bef8f6c1ad417071b10bf2c6204134822cc74dc";
        hash = "sha256-zY+5b5O+jZjQSE7zTWrWth8dDUlmpeCRiCBSCFR1Xbg=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the style conventions in PEP 8 and generate xUnit test result files.";
  };
})
