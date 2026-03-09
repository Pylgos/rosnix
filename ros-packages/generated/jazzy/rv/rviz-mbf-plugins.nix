{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rviz-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_mbf_plugins";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."rviz_mbf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-msgs pluginlib rclcpp rclcpp-action rviz-common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-msgs pluginlib rclcpp rclcpp-action rviz-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_mbf_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_mbf_plugins-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "4ca0c6d7fd50c9d58c1798bb698b7772094c933b";
        hash = "sha256-kBf2CXqpYsj6J6BETKLaLlqW9V4k1RaznHYYpsmBxFo=";
      };
    };
  });
  meta = {
    description = "\n    Contains rviz plugins for interacting with move base flex.\n  ";
  };
})
