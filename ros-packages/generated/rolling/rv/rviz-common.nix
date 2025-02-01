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
  tinyxml2-vendor,
  urdf,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_common";
  version = "14.4.2-1";
  src = finalAttrs.passthru.sources."rviz_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros tinyxml2-vendor urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-svg" "libqt5-svg-dev" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_common" = substituteSource {
      src = fetchgit {
        name = "rviz_common-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "79cb440305d7b8d4018167896669e36231d1a46a";
        hash = "sha256-kqiyWZUDLnQTtpVjmcrAUh0TCfyRjA3TZJdxb0tuucQ=";
      };
    };
  });
  meta = {
    description = "Common rviz API, used by rviz plugins and applications.";
  };
})
