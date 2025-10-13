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
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing";
  version = "3.9.3-1";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = [ ament-index-python launch osrf-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch osrf-pycommon ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "5562d4505ab6faebcfc52cedeca43f18a624a998";
        hash = "sha256-7wxj94Ks9H9zFw1O+keumuadgfRqxSH0M0Lq3huXllE=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
