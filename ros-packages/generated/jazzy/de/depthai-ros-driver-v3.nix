{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  camera-calibration,
  camera-info-manager,
  cv-bridge,
  depthai-bridge-v3,
  depthai-descriptions-v3,
  depthai-ros-msgs-v3,
  depthai-v3,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-image-transport-msgs,
  geometry-msgs,
  image-pipeline,
  image-transport,
  image-transport-plugins,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
  vision-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_ros_driver_v3";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver_v3";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai-bridge-v3 depthai-descriptions-v3 depthai-ros-msgs-v3 depthai-v3 diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai-bridge-v3 depthai-descriptions-v3 depthai-ros-msgs-v3 depthai-v3 diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver_v3" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver_v3-source";
        url = "https://github.com/luxonis/depthai-ros-v3-release.git";
        rev = "0bb59e36a8853351130e3bf8bfdb2704669b5625";
        hash = "sha256-rBnlm6HLjbWHiVistmBE9gCbBGxeVaQkZaVq/FuFdV8=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
