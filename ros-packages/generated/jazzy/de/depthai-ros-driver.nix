{
  ament-cmake,
  ament-cmake-auto,
  buildAmentCmakePackage,
  camera-calibration,
  cv-bridge,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-examples,
  depthai-ros-msgs,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg-image-transport-msgs,
  image-pipeline,
  image-transport,
  image-transport-plugins,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  vision-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_ros_driver";
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration cv-bridge depthai depthai-bridge depthai-descriptions depthai-examples depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs image-pipeline image-transport image-transport-plugins pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "ad136cf649e8bfdd235a20774f9836e8a436900a";
        hash = "sha256-+I9mRktj9vHR358cqy83jTdJfnx/ReFVySFU6T4bgV0=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
