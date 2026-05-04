{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_package";
  version = "0.18.3-2";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_package" = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "80bf9cc03a10a603e307da4a7d4d9ab5baced2e0";
        hash = "sha256-W8BgP9oomWzM38c1QOSqSP9wlKN/Gd7yJX6QLuzYSUA=";
      };
    };
  });
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
