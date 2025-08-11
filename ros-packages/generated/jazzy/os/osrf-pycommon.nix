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
  pname = "osrf_pycommon";
  version = "2.1.7-1";
  src = finalAttrs.passthru.sources."osrf_pycommon";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-importlib-metadata" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_pycommon" = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "4d516443cf22a44a39d4a97f19b1a67bfaaedac7";
        hash = "sha256-04tFBkhp9tqQJPD6369VKIDPl4cO4QCywY3YVGJLZe0=";
      };
    };
  });
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
})
