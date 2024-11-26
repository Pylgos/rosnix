{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_imu_plugin";
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."rviz_imu_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_imu_plugin" = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "a0ec14e09a1d2d2f576cc728e69df301ead4bd80";
        hash = "sha256-S/TxrAWevdoOJZ1nm/+DZ1eieUMfvPwDNom7fvTSoKM=";
      };
    };
  });
  meta = {
    description = "RVIZ plugin for IMU visualization";
  };
})
