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
  version = "2.1.4-3";
  src = finalAttrs.passthru.sources."osrf_pycommon";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_pycommon" = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "77786223feb1aa12ee889310a09c68c575612f29";
        hash = "sha256-r7SjLNdaRpcA2w4gbir3vE/3B7hy6aHv2HUw8wJi8OI=";
      };
    };
  });
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
})
