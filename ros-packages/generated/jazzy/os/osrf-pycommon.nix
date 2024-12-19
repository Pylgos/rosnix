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
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."osrf_pycommon";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_pycommon" = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "688bb8a4780314188dccc6d319cf57440d4b8409";
        hash = "sha256-sCC4cTeXVzhU2x3GSvTgNEBpndaYG0H5n7TV2MyKARc=";
      };
    };
  });
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
})
