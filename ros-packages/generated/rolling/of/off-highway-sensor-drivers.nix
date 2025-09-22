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
  version = "1.0.0-1";
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
        rev = "9a726cd9959eb70a855ba9390587254437291d78";
        hash = "sha256-Zh5kZWFN4T3vqVyu1J6Ri42Ih+9k6O4OjHaVUUTpTm8=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers package";
  };
})
