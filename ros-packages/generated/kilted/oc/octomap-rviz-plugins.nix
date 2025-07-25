{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap-msgs,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_rviz_plugins";
  version = "2.1.1-2";
  src = finalAttrs.passthru.sources."octomap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ octomap-msgs rclcpp rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ octomap-msgs rclcpp rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "octomap_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
        rev = "533356a81ad76237b874e88660bf2ade71a063bb";
        hash = "sha256-QVITVxkP6CU0CctWwD8LPkQMcPlNyOgkrz/NV/aARM0=";
      };
    };
  });
  meta = {
    description = "\n     A set of plugins for displaying occupancy information decoded from binary octomap messages.\n  ";
  };
})
