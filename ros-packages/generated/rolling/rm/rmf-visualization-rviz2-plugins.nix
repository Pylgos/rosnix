{
  ament-cmake,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  resource-retriever,
  rmf-door-msgs,
  rmf-lift-msgs,
  rmf-traffic-ros2,
  rmf-utils,
  rmf-visualization-msgs,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_visualization_rviz2_plugins";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_visualization_rviz2_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ pluginlib rclcpp resource-retriever rmf-door-msgs rmf-lift-msgs rmf-traffic-ros2 rmf-visualization-msgs rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_visualization_rviz2_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_rviz2_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "331871422276d7828b62b69cc986a71090d035c1";
        hash = "sha256-ADRDVVQ+w2iaV10tSSDWDRbz0wwzrCcnPRykD9LN9qM=";
      };
    };
  });
  meta = {
    description = "A package containing RViz2 plugins for RMF";
  };
})
