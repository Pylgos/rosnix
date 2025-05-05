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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."clearpath_config";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config" = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "ac3e05d3c9391abf7f30332118020b938efcd729";
        hash = "sha256-YK74vaMuscV0ENbpzhLL2pFzZ740tzJoJCoT9v52Jjw=";
      };
    };
  });
  meta = {
    description = "Clearpath Configuration YAML Parser and Writer";
  };
})
