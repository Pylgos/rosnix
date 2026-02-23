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
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."tf_transformations";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-transforms3d" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-transforms3d" ]; };
  checkInputs = [ ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf_transformations" = substituteSource {
      src = fetchgit {
        name = "tf_transformations-source";
        url = "https://github.com/ros2-gbp/tf_transformations_release.git";
        rev = "6dd0eb77c4dbb8f5caee6855835b39afbccf2a03";
        hash = "sha256-MJVAaDHgfXDAqq1Tbu4GX27UA5R6KPj2apttUru2ogI=";
      };
    };
  });
  meta = {
    description = "\n      Reimplementation of the tf/transformations.py library for common Python spatial operations\n  ";
  };
})
