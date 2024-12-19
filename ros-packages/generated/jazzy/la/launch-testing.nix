{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-xml,
  launch-yaml,
  mkSourceSet,
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing";
  version = "3.4.3-1";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-xml launch-yaml osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "adf664f74523d9530e2784ef770a4fd1d8653b4b";
        hash = "sha256-LtBY5JfyZOtZJKrbTbh1KrwUBna8FkvIwFRq5H9Uppw=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
