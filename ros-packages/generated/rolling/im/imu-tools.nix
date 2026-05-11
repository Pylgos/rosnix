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
  version = "2.2.3-1";
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
        rev = "d641fc300ad0eb9d1014c0eadfa170444857e3e4";
        hash = "sha256-JL5/2yiZGN//UFTvKQZShSfdyFG8mRFjz0H2GvduIZs=";
      };
    };
  });
  meta = {
    description = "\n    Various tools for IMU devices\n  ";
  };
})
