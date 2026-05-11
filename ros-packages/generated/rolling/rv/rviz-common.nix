{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  resource-retriever,
  rosSystemPackages,
  rviz-ogre-vendor,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
  urdf,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_common";
  version = "16.0.0-1";
  src = finalAttrs.passthru.sources."rviz_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtcore" "libqtgui" "libqtopengl" "libqtsvg" "libqtwidgets" "qt-base-dev" "qt-svg-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtcore" "libqtgui" "libqtopengl" "libqtsvg" "libqtwidgets" "qt-base-dev" "qt-svg-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_common" = substituteSource {
      src = fetchgit {
        name = "rviz_common-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "c3bc692af4c03f2d0f098087be90a8270444677c";
        hash = "sha256-uRJplIbk0GGHIRzSj3wBpQPmqJi8iYEv64TsjAJjZeE=";
      };
    };
  });
  meta = {
    description = "\n    Common rviz API, used by rviz plugins and applications.\n  ";
  };
})
