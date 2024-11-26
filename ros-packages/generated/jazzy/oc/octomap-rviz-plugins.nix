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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."octomap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedBuildInputs = [ octomap-msgs rclcpp rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "octomap_rviz_plugins" = substituteSource {
        src = fetchgit {
          name = "octomap_rviz_plugins-source";
          url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
          rev = "8dadcae1b5f69dd2291df40df5f949fb0a62b3b0";
          hash = "sha256-jYZZwVA/LByiBlY+KXs0ETYwsDlvq8yjFj31QoHrvM0=";
        };
      };
    });
  };
  meta = {
    description = "A set of plugins for displaying occupancy information decoded from binary octomap messages.";
  };
})
