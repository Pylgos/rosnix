{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-processors,
  imu-transformer,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_pipeline";
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."imu_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ imu-processors imu-transformer ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-processors imu-transformer ];
  passthru.sources = mkSourceSet (sources: {
    "imu_pipeline" = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "1ddbf92beaec764df824810c2300caf3324338c7";
        hash = "sha256-3TKdi/ooFg887F3bWWqPUfwgMzc4ysKOUNjlaYJ3RGk=";
      };
    };
  });
  meta = {
    description = "imu_pipeline";
  };
})
