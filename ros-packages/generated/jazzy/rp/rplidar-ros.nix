{
  ament-cmake-auto,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rplidar_ros";
  version = "2.1.0-4";
  src = finalAttrs.passthru.sources."rplidar_ros";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-srvs ];
  buildInputs = [ ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "rplidar_ros" = substituteSource {
      src = fetchgit {
        name = "rplidar_ros-source";
        url = "https://github.com/ros2-gbp/rplidar_ros-release.git";
        rev = "62ee07ff9d0bf9532bbdcdb1b8f0c22f8e7b25b8";
        hash = "sha256-lOiYrTggsDiQb9sCYtWAup4+kVoMnpSYqKqWGtnb2AU=";
      };
    };
  });
  meta = {
    description = "The rplidar ros package, support rplidar A2/A1 and A3/S1";
  };
})
