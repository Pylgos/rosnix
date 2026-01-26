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
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."rviz_imu_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering sensor-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_imu_plugin" = substituteSource {
      src = fetchgit {
        name = "rviz_imu_plugin-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "bfc684cb442790ec560eabd8c1360e55fd777f7e";
        hash = "sha256-lHcd1RN94IJ1OHn7ojD0ePKnx0q9im8srIhzLc8RAxk=";
      };
    };
  });
  meta = {
    description = "\n    RVIZ plugin for IMU visualization\n  ";
  };
})
