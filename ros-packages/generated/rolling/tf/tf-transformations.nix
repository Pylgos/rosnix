{
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
  pname = "tf_transformations";
  version = "1.0.1-4";
  src = finalAttrs.passthru.sources."tf_transformations";
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf_transformations" = substituteSource {
      src = fetchgit {
        name = "tf_transformations-source";
        url = "https://github.com/ros2-gbp/tf_transformations_release.git";
        rev = "46e49385caef93d5ce0ac3663e2b26ce83c3ec1b";
        hash = "sha256-ZpntCNRY//B8eLWdIgouelBtxzP77cHw4dIl0MVnAig=";
      };
    };
  });
  meta = {
    description = "\n      Reimplementation of the tf/transformations.py library for common Python spatial operations\n  ";
  };
})
