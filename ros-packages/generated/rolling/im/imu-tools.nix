{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-complementary-filter,
  imu-filter-madgwick,
  mkSourceSet,
  rosSystemPackages,
  rviz-imu-plugin,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_tools";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."imu_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  passthru.sources = mkSourceSet (sources: {
    "imu_tools" = substituteSource {
      src = fetchgit {
        name = "imu_tools-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "4978e58d198802263f75322fb240ade98cdf8875";
        hash = "sha256-DPO6eQ9zFsrYzwZu0/CbZyc32kJTMPOX4VYL3ZbsTms=";
      };
    };
  });
  meta = {
    description = "\n    Various tools for IMU devices\n  ";
  };
})
