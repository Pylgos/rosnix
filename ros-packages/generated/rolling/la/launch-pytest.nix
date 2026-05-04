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
  version = "3.9.7-2";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-testing ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_pytest" = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "0347cf7dbf69ffab31c7f127f850ab11504b0c48";
        hash = "sha256-JaitSP6lZITbOSHA0QvutttFWhIlQVrQhhDuu5Fqh2Q=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
