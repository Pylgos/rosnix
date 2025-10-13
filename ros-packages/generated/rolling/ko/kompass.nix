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
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."kompass";
  propagatedNativeBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pykdl" ]; };
  propagatedBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kompass" = substituteSource {
      src = fetchgit {
        name = "kompass-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "f543c173a5cbb9b72bd3494a3a86693c702bdee0";
        hash = "sha256-mhd515G3+9vbrPgP7KiOESeDZecZIB3ecjT+3VzewP8=";
      };
    };
  });
  meta = {
    description = "Kompass: Event-driven navigation system";
  };
})
