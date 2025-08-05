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
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."clearpath_config";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config" = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "f11c9482abca053ffa07bcb6ba549658206f3a94";
        hash = "sha256-t5FVmCnIt3k6KVyKGoHpmdl8SmncCbkYRhyVKSdZf10=";
      };
    };
  });
  meta = {
    description = "Clearpath Configuration YAML Parser and Writer";
  };
})
