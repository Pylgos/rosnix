{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-lifecycle-manager,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  resource-retriever,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  urdf,
  visualization-msgs,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_rviz_plugins";
  version = "1.3.10-1";
  src = finalAttrs.passthru.sources."nav2_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-lifecycle-manager nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle resource-retriever rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering std-msgs tf2-geometry-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-lifecycle-manager nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-lifecycle resource-retriever rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering std-msgs tf2-geometry-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "65b9971b4998dec80b39f8ae897010bfa2bf1340";
        hash = "sha256-kRLw2eO03nIzMI+DkfGsnRX52y88xPrOx/pGVQajyAw=";
      };
    };
  });
  meta = {
    description = "Navigation 2 plugins for rviz";
  };
})
