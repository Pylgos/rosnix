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
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_pytest";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_pytest" = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "a8b47a669e9e5d97f5ff394e8449d54e8986c135";
        hash = "sha256-HlBVXTlLCSten0VlJ+vg6hIlTWaBp5o4da3OiC38m0E=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
