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
  version = "2.10.3-1";
  src = finalAttrs.passthru.sources."depthai_ros_driver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ camera-calibration cv-bridge depthai depthai-bridge depthai-descriptions depthai-examples depthai-ros-msgs diagnostic-msgs diagnostic-updater ffmpeg-image-transport-msgs image-pipeline image-transport image-transport-plugins pluginlib rclcpp rclcpp-components sensor-msgs std-msgs std-srvs vision-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depthai_ros_driver" = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "9f409e91f5fa3fbfd09da1a1165428abb1c16219";
        hash = "sha256-syyKqSWK2brFG2eOZ0V+QcBxEHsVb/vboVPrkSATWTA=";
      };
    };
  });
  meta = {
    description = "Depthai ROS Monolithic node.";
  };
})
