{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-python,
  backward-ros,
  buildAmentCmakePackage,
  camera-calibration,
  camera-info-manager,
  cv-bridge,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-ros-msgs,
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
  pname = "depthai_ros_driver";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "69732370e1e433909b5bc9a477dc02898dc0ec3d";
        hash = "sha256-U1HzREHvnxZFIz0GnnhOPwVe/IoZUmTDdJCulxGlL2Q=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
