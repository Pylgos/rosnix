{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_imu_preintegration";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_imu_preintegration";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_imu_preintegration" = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "81f588163082cf561cba1068bf1ed34a370097f8";
        hash = "sha256-6IKM4vjsNuU1gYOWVrkvSjV2J7zqlBL8gT4l49d3dX0=";
      };
    };
  });
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
