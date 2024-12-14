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
  version = "2.8.2-1";
  src = finalAttrs.passthru.sources."slam_toolbox";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ bond bondcpp builtin-interfaces interactive-markers lifecycle-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-lifecycle rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "liblapack-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" "suitesparse" "tbb" ]; };
  checkInputs = [ ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gtest ament-cmake-uncrustify ament-lint-auto launch launch-testing ];
  passthru.sources = mkSourceSet (sources: {
    "slam_toolbox" = substituteSource {
      src = fetchgit {
        name = "slam_toolbox-source";
        url = "https://github.com/SteveMacenski/slam_toolbox-release.git";
        rev = "32724fa3642b7e0ce8134da548de06fc3f6ffa60";
        hash = "sha256-pWJ27U7+GomQhLfCdYg7SGznuB6/wdhajsq7N6Po1Io=";
      };
    };
  });
  meta = {
    description = "This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets";
  };
})
