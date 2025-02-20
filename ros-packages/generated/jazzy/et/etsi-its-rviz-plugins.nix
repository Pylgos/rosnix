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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-mapem-ts-msgs etsi-its-msgs-utils etsi-its-spatem-ts-msgs pluginlib rclcpp rviz2 rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering rviz-satellite tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "python3-pyproj" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "etsi_its_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "2eaee95499d13612c0b50eb6ba7cf0b8bb6839a2";
        hash = "sha256-8Eui5G6J+tNgMHyVKQZY1vQwqxvvmE60/5vZgg2vYgg=";
      };
    };
  });
  meta = {
    description = "RViz plugin for ROS 2 messages based on ETSI ITS messages";
  };
})
