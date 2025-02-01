{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  twist-mux,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "clearpath_bt_joy";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_bt_joy";
  propagatedBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bluez" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bt_joy" = substituteSource {
      src = fetchgit {
        name = "clearpath_bt_joy-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "e5f02eb61c3ddcd236e0566367c748fd48299f73";
        hash = "sha256-B5Lkyh/ISYGjJJl/7ct2M6joZq7MsnQmzD5PndNRMBk=";
      };
    };
  });
  meta = {
    description = "Clearpath bluetooth joy controller signal quality monitoring node";
  };
})
