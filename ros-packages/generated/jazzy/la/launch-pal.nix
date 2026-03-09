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
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."launch_pal";
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-jinja2" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_pal" = substituteSource {
      src = fetchgit {
        name = "launch_pal-source";
        url = "https://github.com/ros2-gbp/launch_pal-release.git";
        rev = "bc535461a80b8c602589c483aacd20a1aac2d5de";
        hash = "sha256-TtXHV0DdsxK1Ew/8Usgsr2iYUFVyhsAeES/k8HYCgGI=";
      };
    };
  });
  meta = {
    description = "Utilities for launch files";
  };
})
