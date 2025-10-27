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
        rev = "5ba296e5334cb93793d275952ab7516e5ef6003c";
        hash = "sha256-YnXcdWkSgzLnQD2mp7TAsv4CBIDyjdI8bRjnxYsxudY=";
      };
    };
  });
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
