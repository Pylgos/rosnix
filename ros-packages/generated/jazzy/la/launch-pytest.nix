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
  launch-testing,
  mkSourceSet,
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_pytest";
  version = "3.4.7-1";
  src = finalAttrs.passthru.sources."launch_pytest";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-testing osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch ];
  passthru.sources = mkSourceSet (sources: {
    "launch_pytest" = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "98f93e8f6a88d79d5234e842a58876657d77b650";
        hash = "sha256-GPkqEpUQc0CBuaLTnZ9tEqJiu9IbxKjbPm08BNF0rN0=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
