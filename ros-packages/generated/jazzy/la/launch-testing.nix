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
  version = "3.4.4-1";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-xml launch-yaml osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-xml launch-yaml osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 launch ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "8ab74035b16ea8a9e5fca70685808fa6315ed031";
        hash = "sha256-LBjBfCOoca/ZgWOic0pMthncLiOw3aIgyVO7+krVpUo=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
