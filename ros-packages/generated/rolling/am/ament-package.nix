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
  version = "0.17.2-1";
  src = finalAttrs.passthru.sources."ament_package";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" "python3-importlib-resources" "python3-setuptools" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-flake8" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_package" = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "9e219f4820e43dc9895bb47da71c99866cb5203c";
        hash = "sha256-munR8OGgu26L3QYz7Ka4NIoP48rx9obrFV/r4LSA/Js=";
      };
    };
  });
  meta = {
    description = "The parser for the manifest files in the ament buildsystem.";
  };
})
