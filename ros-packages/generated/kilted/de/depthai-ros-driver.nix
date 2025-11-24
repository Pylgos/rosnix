{
  ament-cmake,
  ament-cmake-auto,
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
  version = "3.0.10-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto backward-ros camera-calibration camera-info-manager cv-bridge depthai depthai-bridge depthai-descriptions depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs geometry-msgs image-pipeline image-transport image-transport-plugins nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs tf2-ros vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "d393d3e7839b892ce344e8431e547547c535757b";
        hash = "sha256-edPjqf2xNIxypKlXvh5NgSg/F29rytOeo1ycWgNUaI4=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
