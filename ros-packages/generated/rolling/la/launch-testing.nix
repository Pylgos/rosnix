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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing";
  version = "3.10.0-1";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = [ ament-index-python launch ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "8151d50c7be534dea4d9aed0e3dba15d93e0711d";
        hash = "sha256-eDN5+yfzQhHCJpw6IhZ/grli2A0PVgnFmM8z6k0S1HI=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
