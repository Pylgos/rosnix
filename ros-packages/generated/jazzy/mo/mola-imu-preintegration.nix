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
  version = "1.12.0-1";
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
        rev = "0d2dbe4e6b518327ab1ce4dbec2dd9b4ccd888de";
        hash = "sha256-KqiM8QBmDnwEt4QLotCPaCIo0lv5aQS986axTeu0aNg=";
      };
    };
  });
  meta = {
    description = "Integrator of IMU angular velocity readings";
  };
})
