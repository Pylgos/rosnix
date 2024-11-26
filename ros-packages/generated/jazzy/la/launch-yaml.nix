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
  version = "3.4.2-2";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "9ec1892e132a4c5eafda96bbdd987781d98551e6";
        hash = "sha256-iTmdj7Xmv7WasHOQRLTCptwQoYDOht8pT+KWtklLPxI=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
