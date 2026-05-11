{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_pytest";
  version = "3.10.0-1";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-testing ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_pytest" = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "631112ea1a822c77a25dacdbffdb408b9c0ea966";
        hash = "sha256-SqLn8A0otqGAHLfAsfpsqF5uUcRiFcLc9RYiuOixFhY=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
