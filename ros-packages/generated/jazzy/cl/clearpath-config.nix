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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_config";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_config" = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "3badce8404849542c9c19ab3e9fde560769e9550";
        hash = "sha256-fN6p20G3ksFbHTLz+F8I/mMawElrmqwuGRF/iefFJPk=";
      };
    };
  });
  meta = {
    description = "Clearpath Configuration YAML Parser and Writer";
  };
})
