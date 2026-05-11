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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_package" = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "062cce1296f048d02a9133ac959516fc173617aa";
        hash = "sha256-dlGu/OxjigwyGJchXlTvxpzzx9pY8UI6/vQeUv0TX7Q=";
      };
    };
  });
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
