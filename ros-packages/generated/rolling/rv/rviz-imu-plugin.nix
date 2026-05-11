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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_imu_plugin";
  version = "2.2.3-1";
  src = finalAttrs.passthru.sources."rviz_imu_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtcore" "libqtgui" "libqtopengl" "libqtwidgets" "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtcore" "libqtgui" "libqtopengl" "libqtwidgets" "qt-base-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_imu_plugin" = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "f86b4ae947942c9f43e091d2a15b6d4f11d4911e";
        hash = "sha256-5WxpSYxPlLmlyGWQL0yoXSkHalAmumeArZLW4PAFa/8=";
      };
    };
  });
  meta = {
    description = "\n    RVIZ plugin for IMU visualization\n  ";
  };
})
