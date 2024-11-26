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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_imu_preintegration";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libobs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_imu_preintegration" = substituteSource {
        src = fetchgit {
          name = "mola_imu_preintegration-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "b7abb1a8d495e56cba634c4d434bb302fe6b11a4";
          hash = "sha256-2lFa/ZwjfbqRf8af866MhalfCE0tQGhI0BoNXvj76OI=";
        };
      };
    });
  };
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
