{
  ament-copyright,
  ament-flake8,
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
  pname = "launch_yaml";
  version = "3.9.0-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "5099dddce8ed62e54150696af76ee482d37837b2";
        hash = "sha256-YoDvbKcp1xu93wiomIR9waUU9nbCWsuGLLwMFjJHtCA=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
