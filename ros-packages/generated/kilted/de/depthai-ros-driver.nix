{
  ament-cmake,
  ament-cmake-auto,
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
  version = "3.0.7-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "28353bd55c35fce692eb5746872db37e6b8057d4";
        hash = "sha256-jvSSR6Z0zLj7c5rXYEI2Xo+BG79SQb963iK2ztzDkH0=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
