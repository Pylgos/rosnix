{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ament_black";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."ament_black";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "black" "python3-unidiff" "python3-uvloop" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_black" = substituteSource {
      src = fetchgit {
        name = "ament_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "ed810c9f99b58d39dbe9b4f9c42cd3f8edeba6cd";
        hash = "sha256-CVThJWwGw8u3uwsE3Z5CF7BueCI08EkNe+eW6X/copE=";
      };
    };
  });
  meta = {
    description = "The ability to check code against style conventions using black and generate xUnit test result files.";
  };
})
