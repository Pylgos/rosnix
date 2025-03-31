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
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."clearpath_config";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config" = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "871eabc9b45cb6c46e6d83ab7bcdf28cefe2a295";
        hash = "sha256-sX7W8hl3Q5HGnLEZ6Wgsh2oA7PK0/d42YtzwOEReXKM=";
      };
    };
  });
  meta = {
    description = "Clearpath Configuration YAML Parser and Writer";
  };
})
