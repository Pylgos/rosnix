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
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch ];
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_pytest" = substituteSource {
        src = fetchgit {
          name = "launch_pytest-source";
          url = "https://github.com/ros2-gbp/launch-release.git";
          rev = "91aa4a31b47770aa4ba4b8964257c171cceb9fad";
          hash = "sha256-LOntSJmZc+jd0Kl8UfZApRVEbEE+pWYCQ8tQsaDcsk8=";
        };
      };
    });
  };
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
