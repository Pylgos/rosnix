{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "clearpath_config";
  version = "2.8.1-1";
  src = finalAttrs.passthru.sources."clearpath_config";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config" = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "eccca779514f980eb979f5169cebb02ec5022c84";
        hash = "sha256-Gm8EnsUmCo2aepCmO/YX/nFmjNsX5p8yswRxhnw7LaM=";
      };
    };
  });
  meta = {
    description = "Clearpath Configuration YAML Parser and Writer";
  };
})
