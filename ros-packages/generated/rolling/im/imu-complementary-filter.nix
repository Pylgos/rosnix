{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_complementary_filter";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."imu_complementary_filter";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs message-filters sensor-msgs std-msgs tf2 tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "imu_complementary_filter" = substituteSource {
      src = fetchgit {
        name = "imu_complementary_filter-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "f71e98063619c9fac2606354ce9ad4c88b7021b5";
        hash = "sha256-mp1e1vKWtoEnUp5HKzmeDesS3x6oCbGylokG14wOlGA=";
      };
    };
  });
  meta = {
    description = "Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into a quaternion to represent the orientation of the device wrt the global frame. Based on the algorithm by Roberto G. Valenti etal. described in the paper \"Keeping a Good Attitude: A Quaternion-Based Orientation Filter for IMUs and MARGs\" available at http://www.mdpi.com/1424-8220/15/8/19302 .";
  };
})
