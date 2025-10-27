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
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_common";
  version = "15.1.11-1";
  src = finalAttrs.passthru.sources."rviz_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg" "libqt5-svg-dev" "libqt5-widgets" "qtbase5-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg" "libqt5-svg-dev" "libqt5-widgets" "qtbase5-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_common" = substituteSource {
      src = fetchgit {
        name = "rviz_common-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "e63642fddc8596b5d63490748f804b50b0dffd35";
        hash = "sha256-bMI7ks8NzvOLn5J87iZSX1PCVXmZxRdvvUS1PFk+W6M=";
      };
    };
  });
  meta = {
    description = "\n    Common rviz API, used by rviz plugins and applications.\n  ";
  };
})
