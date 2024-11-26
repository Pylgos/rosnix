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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."imu_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ imu-complementary-filter imu-filter-madgwick rviz-imu-plugin ];
  passthru = {
    sources = mkSourceSet (sources: {
      "imu_tools" = substituteSource {
        src = fetchgit {
          name = "imu_tools-source";
          url = "https://github.com/ros2-gbp/imu_tools-release.git";
          rev = "8a41ced25e631717e56c24cfa375edff7d68ad20";
          hash = "sha256-RYtGkmyCnleRNM/JSK+PXSSNuFKByBaAj7lGoDv8zl8=";
        };
      };
    });
  };
  meta = {
    description = "Various tools for IMU devices";
  };
})
