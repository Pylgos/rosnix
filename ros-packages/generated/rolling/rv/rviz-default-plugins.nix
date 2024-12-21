{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gz-math-vendor,
  image-transport,
  interactive-markers,
  laser-geometry,
  map-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  point-cloud-transport,
  rclcpp,
  resource-retriever,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  rviz-rendering-tests,
  rviz-visual-testing-framework,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  urdf,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_default_plugins";
  version = "14.4.0-1";
  src = finalAttrs.passthru.sources."rviz_default_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs gz-math-vendor image-transport interactive-markers laser-geometry map-msgs nav-msgs pluginlib point-cloud-transport rclcpp resource-retriever rviz-common rviz-ogre-vendor rviz-rendering tf2 tf2-geometry-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-lint-cmake ament-index-cpp ament-lint-auto ament-lint-common rviz-rendering-tests rviz-visual-testing-framework ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_default_plugins-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "861f639b2a4c9b9fc728878da786cc4b608bc494";
        hash = "sha256-mJzMb2UHcXk9Z7SHAZP5LM38SX6WUSStROYJ73gbKAA=";
      };
    };
  });
  meta = {
    description = "Several default plugins for rviz to cover the basic functionality.";
  };
})
