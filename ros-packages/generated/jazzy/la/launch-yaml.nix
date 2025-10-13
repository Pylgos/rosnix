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
  version = "3.4.7-1";
  src = finalAttrs.passthru.sources."launch_yaml";
  propagatedNativeBuildInputs = [ launch ];
  propagatedBuildInputs = [ launch ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_yaml" = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "9cf2ecef2ad4141f35117e0e4521a1e3d4bee46f";
        hash = "sha256-uumvIHJouX7sAQFHzQJmkJhWBPDfW97cZkeAa2omMx8=";
      };
    };
  });
  meta = {
    description = "YAML frontend for the launch package.";
  };
})
