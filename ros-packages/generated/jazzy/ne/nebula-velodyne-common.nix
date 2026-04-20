{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_velodyne_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_velodyne_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nebula_velodyne_common" = substituteSource {
      src = fetchgit {
        name = "nebula_velodyne_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "d33eb7716fa1b3437abd09dc2bcdbf0dd193e40c";
        hash = "sha256-zmQ1LVAyg39qb7reGrV1xgbXBCFYJyTSAJueyI6O1h0=";
      };
    };
  });
  meta = {
    description = "Nebula Common Velodyne Libraries and headers";
  };
})
