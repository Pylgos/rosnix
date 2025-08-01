{
  ament-cmake,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gtest,
  ament-cmake-uncrustify,
  ament-lint-auto,
  bond,
  bondcpp,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive-markers,
  launch,
  launch-testing,
  lifecycle-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-map-server,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "slam_toolbox";
  version = "2.9.0-2";
  src = finalAttrs.passthru.sources."slam_toolbox";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ bond bondcpp builtin-interfaces interactive-markers lifecycle-msgs message-filters nav2-map-server nav-msgs pluginlib rclcpp rclcpp-lifecycle rosidl-default-generators rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp builtin-interfaces interactive-markers lifecycle-msgs message-filters nav2-map-server nav-msgs pluginlib rclcpp rclcpp-lifecycle rosidl-default-generators rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-uncrustify ament-lint-auto launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "slam_toolbox" = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "b4d30cedb9ac9cc108336667c0335edbe9379d19";
        hash = "sha256-YjIe4lUWiaDE2aL8hEHeSfCNOYGfZcRz1JmivLHmE3A=";
      };
    };
  });
  meta = {
    description = "\n     This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets\n  ";
  };
})
