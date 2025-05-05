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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."clearpath_bt_joy";
  propagatedBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bluez" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bt_joy" = substituteSource {
      src = fetchgit {
        name = "clearpath_bt_joy-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "b6d273be83c0ab85d6c6147257432f2f642cc63f";
        hash = "sha256-4um4B/Kdj3tDKKKeyLSxaTgtr/pB5h7YuFHoZVMVMog=";
      };
    };
  });
  meta = {
    description = "Clearpath bluetooth joy controller signal quality monitoring node";
  };
})
