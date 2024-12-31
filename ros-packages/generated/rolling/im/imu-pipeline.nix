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
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."imu_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-processors imu-transformer ];
  passthru.sources = mkSourceSet (sources: {
    "imu_pipeline" = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "f1629b45f04c4f18a60b7542a6b5cafe28e5b496";
        hash = "sha256-9xMqedHJei8MHcCkj1SBnubRex6dxDBOsh1twB+KxCY=";
      };
    };
  });
  meta = {
    description = "imu_pipeline";
  };
})
