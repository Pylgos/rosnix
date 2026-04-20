{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  nebula-core-hw-interfaces,
  nebula-velodyne-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_velodyne_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_velodyne_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-velodyne-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-core-common nebula-core-hw-interfaces nebula-velodyne-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_velodyne_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_velodyne_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "2b662f0fa376019cf265ace1fa32cc33405b0983";
        hash = "sha256-/LA5hgXsdxe8Om2ud/RXqaKZ/pmh4QZoXVrag0UQ3xM=";
      };
    };
  });
  meta = {
    description = "Nebula HW Interfaces Velodyne";
  };
})
