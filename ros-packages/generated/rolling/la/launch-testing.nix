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
  launch-xml,
  launch-yaml,
  mkSourceSet,
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing";
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-xml launch-yaml osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "b73c8f7d4cab4d1c76a7488c69aae26539ea2315";
        hash = "sha256-J7HjHM2k8aopvVv7dXrhFCXdFIpKCHV161DoAD61i/w=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
