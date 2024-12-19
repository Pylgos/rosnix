{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "3.4.3-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "d95701fc26c760b714bb0e797e8830ef8078a4ee";
        hash = "sha256-fZ0CQVJaL4M7Exh8DsiWSGCXcNbc2XOaExPw4D9AJ1c=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
