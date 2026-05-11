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
  version = "2.2.3-1";
  src = finalAttrs.passthru.sources."imu_complementary_filter";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters rclcpp sensor-msgs std-msgs tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs message-filters rclcpp sensor-msgs std-msgs tf2 tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "imu_complementary_filter" = substituteSource {
      src = fetchgit {
        name = "imu_complementary_filter-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "c842f4396d92d859eaef47247e9732af48a2d6c1";
        hash = "sha256-Pr+qkXwWHs57ZWQlbFEZ18+zROme638kSMG/cIYTsXY=";
      };
    };
  });
  meta = {
    description = "Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into a quaternion to represent the orientation of the device wrt the global frame. Based on the algorithm by Roberto G. Valenti etal. described in the paper \"Keeping a Good Attitude: A Quaternion-Based Orientation Filter for IMUs and MARGs\" available at http://www.mdpi.com/1424-8220/15/8/19302 .";
  };
})
