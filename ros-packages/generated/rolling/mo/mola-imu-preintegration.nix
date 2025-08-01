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
  version = "1.9.0-1";
  src = finalAttrs.passthru.sources."mola_imu_preintegration";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_imu_preintegration" = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "0fab052362aabe9035f5a7c7f8e4dcdd374f8ef6";
        hash = "sha256-eskDiLBMQx+/JZAXINNM4VU3C9aR3XshNhFkiI6J+yU=";
      };
    };
  });
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
