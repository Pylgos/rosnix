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
  version = "15.1.16-1";
  src = finalAttrs.passthru.sources."rviz_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6svg6" "libqt6widgets6t64" "qt6-base-dev" "qt6-svg-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs message-filters pluginlib rclcpp resource-retriever rviz-ogre-vendor rviz-rendering sensor-msgs std-msgs std-srvs tf2 tf2-ros urdf yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6svg6" "libqt6widgets6t64" "qt6-base-dev" "qt6-svg-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_common" = substituteSource {
      src = fetchgit {
        name = "rviz_common-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "92d9f5bed8ccca013468e075202a64471f2fe28f";
        hash = "sha256-G6LkOsQwqRT9v9BiOzUsW4T+FkhzaZF7dvZbKPspCpA=";
      };
    };
  });
  meta = {
    description = "\n    Common rviz API, used by rviz plugins and applications.\n  ";
  };
})
