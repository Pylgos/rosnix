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
  version = "14.3.3-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rviz2" = substituteSource {
        src = fetchgit {
          name = "rviz2-source";
          url = "https://github.com/ros2-gbp/rviz-release.git";
          rev = "fa3c60db9e5b69273a52740e08cf3b78229e62c8";
          hash = "sha256-L7kQXU9txqKr1FZM7/AtXTwPEXKXbY1FU/XaPaWCMZg=";
        };
      };
    });
  };
  meta = {
    description = "3D visualization tool for ROS.";
  };
})
