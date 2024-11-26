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
  version = "0.16.3-3";
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
          rev = "70ffe60211c4feae5e780e5bc95e169d2f79e7ec";
          hash = "sha256-UQTsrOgp2aSxuorO8p8yEInpzIOb5c6+s5Jp1F/FD9c=";
        };
      };
    });
  };
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
