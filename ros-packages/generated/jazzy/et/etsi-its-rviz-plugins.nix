{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-msgs,
  etsi-its-cpm-ts-msgs,
  etsi-its-denm-msgs,
  etsi-its-mapem-ts-msgs,
  etsi-its-msgs-utils,
  etsi-its-spatem-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  rviz-satellite,
  rviz2,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_rviz_plugins";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-mapem-ts-msgs etsi-its-msgs-utils etsi-its-spatem-ts-msgs pluginlib rviz2 rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering rviz-satellite tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "python3-pyproj" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "etsi_its_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9390c4e8d1b160c832607aada90a0c0163f2ad71";
        hash = "sha256-evUKvtAMXPGO+H8oq6XYUHMbCJS1yVYpuA4hBMOrKQo=";
      };
    };
  });
  meta = {
    description = "RViz plugin for ROS 2 messages based on ETSI ITS messages";
  };
})
