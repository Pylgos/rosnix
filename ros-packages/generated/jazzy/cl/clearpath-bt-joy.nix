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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."clearpath_bt_joy";
  propagatedBuildInputs = [ joy-linux twist-mux ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bluez" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "clearpath_bt_joy" = substituteSource {
      src = fetchgit {
        name = "clearpath_bt_joy-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "5494bbfb5285f5db1bf0990a655108d642be0a9e";
        hash = "sha256-04KDqxxcDVNMUfRNY0Hgx9GiY9vkJ3LJHJNcdDodukY=";
      };
    };
  });
  meta = {
    description = "Clearpath bluetooth joy controller signal quality monitoring node";
  };
})
