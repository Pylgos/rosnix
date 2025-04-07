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
  version = "2.1.6-1";
  src = finalAttrs.passthru.sources."osrf_pycommon";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_pycommon" = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "aa0013f41b822d3ad22858480b14bef9af9ee1e0";
        hash = "sha256-moAE+CvUzYOkq2ZdNlNtTi/hr/6lRHHkxt7jYIhjhHw=";
      };
    };
  });
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
})
