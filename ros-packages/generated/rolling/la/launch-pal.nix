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
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_pal";
  version = "0.20.3-1";
  src = finalAttrs.passthru.sources."launch_pal";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-jinja2" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_pal" = substituteSource {
      src = fetchgit {
        name = "launch_pal-source";
        url = "https://github.com/ros2-gbp/launch_pal-release.git";
        rev = "14a728e5af50c8360ab0976d6dad89c62b1bc89b";
        hash = "sha256-TrP4E43UaaJpjsqR8tNR12HcY1HgBiXzKijG1Seyp4E=";
      };
    };
  });
  meta = {
    description = "Utilities for launch files";
  };
})
