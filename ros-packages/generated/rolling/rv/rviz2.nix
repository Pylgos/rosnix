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
  version = "15.1.7-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz2" = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "6df0b7a9262fbb48cbc0ddf221ef81fe0d9ebbd8";
        hash = "sha256-auk9bEbsm/p9K+fYXKluDsJugUJ8fEZqYM+Fi64U/Ns=";
      };
    };
  });
  meta = {
    description = "\n    3D visualization tool for ROS.\n  ";
  };
})
