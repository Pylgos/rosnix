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
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."clearpath_bt_joy";
  propagatedNativeBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "bluez" ]; };
  propagatedBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bluez" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bt_joy" = substituteSource {
      src = fetchgit {
        name = "clearpath_bt_joy-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "397f8340e56fdf4e2be954a79eb12b02a0f09abf";
        hash = "sha256-Hb/JNCO1Ke8rs56CnjGkhnBR4Mu74KbWVr/uIcFoQf0=";
      };
    };
  });
  meta = {
    description = "Clearpath bluetooth joy controller signal quality monitoring node";
  };
})
