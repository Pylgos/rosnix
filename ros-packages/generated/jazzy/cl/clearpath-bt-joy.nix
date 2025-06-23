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
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."clearpath_bt_joy";
  propagatedNativeBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "bluez" ]; };
  propagatedBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bluez" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bt_joy" = substituteSource {
      src = fetchgit {
        name = "clearpath_bt_joy-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "15a647bf7643bb3afba5f9b96b0f4bf108a83161";
        hash = "sha256-zU2UWLWTCBqciaLbZ3sjC5b34tje/6CAAk4sg8++0fQ=";
      };
    };
  });
  meta = {
    description = "Clearpath bluetooth joy controller signal quality monitoring node";
  };
})
