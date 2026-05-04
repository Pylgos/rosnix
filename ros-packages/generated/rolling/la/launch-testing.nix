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
  version = "3.9.7-2";
  src = finalAttrs.passthru.sources."launch_testing";
  propagatedNativeBuildInputs = [ ament-index-python launch ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  propagatedBuildInputs = [ ament-index-python launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-osrf-pycommon" "python3-pytest" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing" = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "ed13d61a2ebac01495d48e9c4c4fd7eb1eba5581";
        hash = "sha256-SfrHKr/80hVpPf27kwO8GlT3G+fGComUP5c6HKL0x6U=";
      };
    };
  });
  meta = {
    description = "A package to create tests which involve launch files and multiple processes.";
  };
})
