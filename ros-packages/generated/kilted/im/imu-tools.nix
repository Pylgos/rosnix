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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_tools";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."imu_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  passthru.sources = mkSourceSet (sources: {
    "imu_tools" = substituteSource {
      src = fetchgit {
        name = "imu_tools-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "65a92bedf1f443b821dba40e35945d4aaf684507";
        hash = "sha256-d0nISebFCokUb1Svs9PjWIDLhxSDi5sIiOHkxhZpsZ8=";
      };
    };
  });
  meta = {
    description = "\n    Various tools for IMU devices\n  ";
  };
})
