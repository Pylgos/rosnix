{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  control-msgs,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-msgs,
  pal-statistics-msgs,
  qml6-ros2-plugin,
  rcl-interfaces,
  ros-babel-fish-test-msgs,
  rosSystemPackages,
  rqml-core,
  sensor-msgs,
  substituteSource,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqml_default_plugins";
  version = "3.26.41-1";
  src = finalAttrs.passthru.sources."rqml_default_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ control-msgs controller-manager-msgs geometry-msgs moveit-msgs pal-statistics-msgs qml6-ros2-plugin rqml-core sensor-msgs tf2-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qml6-module-qt-labs-qmlmodels" "qml6-module-qtmultimedia" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ control-msgs controller-manager-msgs geometry-msgs moveit-msgs pal-statistics-msgs qml6-ros2-plugin rqml-core sensor-msgs tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml6-module-qt-labs-qmlmodels" "qml6-module-qtmultimedia" "qml6-module-qtquick-controls" "qml6-module-qtquick-dialogs" "qml6-module-qtquick-layouts" ]; };
  checkInputs = [ ament-lint-auto qml6-ros2-plugin rcl-interfaces ros-babel-fish-test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rqml_default_plugins" = substituteSource {
      src = fetchgit {
        name = "rqml_default_plugins-source";
        url = "https://github.com/ros2-gbp/rqml-release.git";
        rev = "d7b7497aef62c82c2237b26fa583c3d3075343c1";
        hash = "sha256-iIYWJY1ao6L8fyLp4jIKFrISLCgwdkZIpRiN5ebFWJE=";
      };
    };
  });
  meta = {
    description = "Default plugins for the QML-based robotics visualization and control tool RQml for ROS 2.";
  };
})
