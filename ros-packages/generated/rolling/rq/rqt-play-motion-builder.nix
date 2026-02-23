{
  ament-cmake-auto,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  play-motion-builder,
  play-motion-builder-msgs,
  play-motion2-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  sensor-msgs,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_play_motion_builder";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."rqt_play_motion_builder";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ class-loader play-motion2-msgs play-motion-builder play-motion-builder-msgs pluginlib rclcpp rclcpp-action rqt-gui rqt-gui-cpp sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ class-loader play-motion2-msgs play-motion-builder play-motion-builder-msgs pluginlib rclcpp rclcpp-action rqt-gui rqt-gui-cpp sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_play_motion_builder" = substituteSource {
      src = fetchgit {
        name = "rqt_play_motion_builder-source";
        url = "https://github.com/ros2-gbp/play_motion_builder-release.git";
        rev = "3b064ba318b74a9da0a6a95c55b8e44a43707cd9";
        hash = "sha256-8YbHPWH5XHp2L5TpjvE8HW97JCJ8srLAqBLyQR8DMFc=";
      };
    };
  });
  meta = {
    description = "The rqt_play_motion_builder package, a front-end interface for play_motion_builder";
  };
})
