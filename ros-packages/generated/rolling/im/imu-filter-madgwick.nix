{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_filter_madgwick";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."imu_filter_madgwick";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rclcpp rclcpp-action rclcpp-lifecycle sensor-msgs tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "imu_filter_madgwick" = substituteSource {
      src = fetchgit {
        name = "imu_filter_madgwick-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "78534e6d5caad55233fbf20a12a9aa3de865e43b";
        hash = "sha256-5Yqmz54RY/a0vdnVHGEFe0wRB11E+5xdXjFDV71FaVw=";
      };
    };
  });
  meta = {
    description = "\n  Filter which fuses angular velocities, accelerations, and (optionally) magnetic readings from a generic IMU device into an orientation. Based on code by Sebastian Madgwick, http://www.x-io.co.uk/node/8#open_source_ahrs_and_imu_algorithms.\n  ";
  };
})
