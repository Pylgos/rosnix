{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  gps-tools,
  gpsd-client,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gps_umd";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."gps_umd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  passthru.sources = mkSourceSet (sources: {
    "gps_umd" = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "bf715c0e88e9619e1fa21b1543e9e681f591d9c4";
        hash = "sha256-Ut+uAu/5g2IjEKgIvehlh6i0KbHvXGqh+HZUbzkq398=";
      };
    };
  });
  meta = {
    description = "gps_umd metapackage";
  };
})
