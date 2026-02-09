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
  version = "1.2.0-1";
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
        rev = "41a33ce00e8640bc8e40301dd68b14042152945a";
        hash = "sha256-l/WtOfSNupLCCRFvwTWzztQdyjGCh1FSooD03Xla5eI=";
      };
    };
  });
  meta = {
    description = "The off_highway_sensor_drivers package";
  };
})
