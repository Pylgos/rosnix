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
  version = "0.18.0-1";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_package" = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "bd4f7b44dfefd7bde8be86a617582f89b173bf0a";
        hash = "sha256-N1SXjvKO6oJy4uUGJ2CUdzJZTDdT3LYQ9NqNW6tCIuo=";
      };
    };
  });
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
