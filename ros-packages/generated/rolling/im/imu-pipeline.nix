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
  version = "0.6.0-1";
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
        rev = "bb5c34c6bb90546d2d96daf35d0a5d8a66716cf1";
        hash = "sha256-IrAT+Zq0mrJjxKPym+Ba/jUPH+Jcgs6nzolQeFlNZbs=";
      };
    };
  });
  meta = {
    description = "imu_pipeline";
  };
})
