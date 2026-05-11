{
  automatika-ros-sugar,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kompass-interfaces,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "kompass";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."kompass";
  propagatedNativeBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  propagatedBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kompass" = substituteSource {
      src = fetchgit {
        name = "kompass-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "0d989f3272873d4d814a1f54d8600da0614917d1";
        hash = "sha256-UHomOsruLf0Sh1X4CK5L/TWEedG8Pb89/aSFuiny/+0=";
      };
    };
  });
  meta = {
    description = "Kompass: Event-driven navigation system";
  };
})
