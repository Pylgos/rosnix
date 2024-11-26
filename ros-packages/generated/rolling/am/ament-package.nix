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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_package" = substituteSource {
        src = fetchgit {
          name = "ament_package-source";
          url = "https://github.com/ros2-gbp/ament_package-release.git";
          rev = "fe52bc6a8cb745137e7d92272d4d1b164c031bce";
          hash = "sha256-86RFBUIc8Ur96L7JYkhpgxQYRCjZ4nLW4RmGH3Rn5go=";
        };
      };
    });
  };
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
