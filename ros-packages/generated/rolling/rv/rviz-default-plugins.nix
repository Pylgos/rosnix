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
  rviz-resource-interfaces,
  rviz-visual-testing-framework,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  urdf,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_default_plugins";
  version = "15.1.16-1";
  src = finalAttrs.passthru.sources."rviz_default_plugins";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ geometry-msgs gz-math-vendor image-transport interactive-markers laser-geometry map-msgs nav-msgs pluginlib point-cloud-transport rclcpp resource-retriever rviz-common rviz-ogre-vendor rviz-rendering rviz-resource-interfaces tf2 tf2-geometry-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ geometry-msgs gz-math-vendor image-transport interactive-markers laser-geometry map-msgs nav-msgs pluginlib point-cloud-transport rclcpp resource-retriever rviz-common rviz-ogre-vendor rviz-rendering rviz-resource-interfaces tf2 tf2-geometry-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-lint-cmake ament-index-cpp ament-lint-auto ament-lint-common rviz-rendering-tests rviz-visual-testing-framework ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rviz_default_plugins-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "b23751abe90f3f607c7d5262eec8bad03fbd9f2b";
        hash = "sha256-YzopcrNaxaQ4/xtBtnrXjHoBpOtgZcOxI6RDiUay77w=";
      };
    };
  });
  meta = {
    description = "\n    Several default plugins for rviz to cover the basic functionality.\n  ";
  };
})
