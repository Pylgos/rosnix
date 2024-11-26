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
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."imu_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  passthru = {
    sources = mkSourceSet (sources: {
      "imu_tools" = substituteSource {
        src = fetchgit {
          name = "imu_tools-source";
          url = "https://github.com/ros2-gbp/imu_tools-release.git";
          rev = "4975511ec10c3670a65f41ee3019e97ad79addc9";
          hash = "sha256-864rIzP+9sO8fEDOd+DnGNd+Mvk33wn0E8Ksys9narA=";
        };
      };
    });
  };
  meta = {
    description = "Various tools for IMU devices";
  };
})
