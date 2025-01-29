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
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."kompass";
  propagatedBuildInputs = [ automatika-ros-sugar kompass-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pykdl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kompass" = substituteSource {
      src = fetchgit {
        name = "kompass-source";
        url = "https://github.com/ros2-gbp/kompass-release.git";
        rev = "3666342d884ca2623fdd38d2b5f4b4ac75a88c1c";
        hash = "sha256-gECTh88w/+BvUUiAo5mSiOfzjP9UdMAZE5kJ/BSD6+Q=";
      };
    };
  });
  meta = {
    description = "Kompass: Event-driven navigation system";
  };
})
