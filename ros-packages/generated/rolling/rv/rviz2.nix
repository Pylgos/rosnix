{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz2";
  version = "14.4.0-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz2" = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "d6e53932fae3031dfb281185baf75c9c97d436bb";
        hash = "sha256-40NXSw7LwjOhEQKHwQJi88ZPD+JWCG6wkRkg2r/h9lM=";
      };
    };
  });
  meta = {
    description = "3D visualization tool for ROS.";
  };
})
