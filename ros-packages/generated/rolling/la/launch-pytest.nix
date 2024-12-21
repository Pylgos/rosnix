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
  version = "3.7.1-1";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch ];
  passthru.sources = mkSourceSet (sources: {
    "launch_pytest" = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "c31d3a0f40e73712aee25fed94d089afcaa2b0e5";
        hash = "sha256-qpV7FZpQt8Bz4f9aY1Xg7k3mnyWe4rKoFH2TZz1tFIs=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
