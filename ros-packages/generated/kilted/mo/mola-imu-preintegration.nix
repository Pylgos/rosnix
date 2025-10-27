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
  version = "1.13.2-1";
  src = finalAttrs.passthru.sources."mola_imu_preintegration";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_imu_preintegration" = substituteSource {
      src = fetchgit {
        name = "mola_imu_preintegration-source";
        url = "https://github.com/ros2-gbp/mola_imu_preintegration-release.git";
        rev = "2dd2c20bd62fe0144c66f9330d8e2cb4af735b07";
        hash = "sha256-YnXcdWkSgzLnQD2mp7TAsv4CBIDyjdI8bRjnxYsxudY=";
      };
    };
  });
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
