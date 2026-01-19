{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  off-highway-can,
  off-highway-general-purpose-radar,
  off-highway-general-purpose-radar-msgs,
  off-highway-premium-radar,
  off-highway-premium-radar-msgs,
  off-highway-premium-radar-sample,
  off-highway-premium-radar-sample-msgs,
  off-highway-radar,
  off-highway-radar-msgs,
  off-highway-uss,
  off-highway-uss-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_sensor_drivers";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."off_highway_sensor_drivers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ off-highway-can off-highway-general-purpose-radar off-highway-general-purpose-radar-msgs off-highway-premium-radar off-highway-premium-radar-msgs off-highway-premium-radar-sample off-highway-premium-radar-sample-msgs off-highway-radar off-highway-radar-msgs off-highway-uss off-highway-uss-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ off-highway-can off-highway-general-purpose-radar off-highway-general-purpose-radar-msgs off-highway-premium-radar off-highway-premium-radar-msgs off-highway-premium-radar-sample off-highway-premium-radar-sample-msgs off-highway-radar off-highway-radar-msgs off-highway-uss off-highway-uss-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_sensor_drivers" = substituteSource {
      src = fetchgit {
        name = "off_highway_sensor_drivers-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "895dfb344a4d71c5b5855bf5a9834973e586031f";
        hash = "sha256-qhlBoSiHWrEe3V8kMGXNRfRQ4rHmtbxPj1j/nWWFcAg=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers package";
  };
})
