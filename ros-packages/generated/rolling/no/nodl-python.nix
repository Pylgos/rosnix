{
  ament-flake8,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  ament-mypy,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nodl_python";
  version = "0.3.1-4";
  src = finalAttrs.passthru.sources."nodl_python";
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  checkInputs = [ ament-flake8 ament-lint-auto ament-lint-common ament-mypy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-mock" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nodl_python" = substituteSource {
      src = fetchgit {
        name = "nodl_python-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "b699bd8f49e8cd26b642940300bdecdc79a5a2c7";
        hash = "sha256-rHEAtKnNTsXSB1UGfZYRfy3DQXrnGFWNntTfJyxEymc=";
      };
    };
  });
  meta = {
    description = "Implementation of the NoDL API in Python.";
  };
})
