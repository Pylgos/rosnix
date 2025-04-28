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
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_pycodestyle";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pycodestyle" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pycodestyle" ]; };
  checkInputs = [ ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_pycodestyle" = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "c203286a762b2161ed73f248eb5f2f033aa0f0db";
        hash = "sha256-LTuI9cu1IW2Drn1dKuSpVwWvTUl7gbeUZBUwhRt2kOY=";
      };
    };
  });
  meta = {
    description = "The ability to check code against the style conventions in PEP 8 and generate xUnit test result files.";
  };
})
