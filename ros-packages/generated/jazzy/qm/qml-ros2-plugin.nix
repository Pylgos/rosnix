{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  ros-babel-fish,
  ros-babel-fish-test-msgs,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qml_ros2_plugin";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."qml_ros2_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp image-transport rclcpp ros-babel-fish tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-multimedia" "libqt5-qml" "libqt5-quick" "qtbase5-dev" "qtdeclarative5-dev" "qtmultimedia5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto example-interfaces ros-babel-fish-test-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qml_ros2_plugin" = substituteSource {
      src = fetchgit {
        name = "qml_ros2_plugin-source";
        url = "https://github.com/ros2-gbp/qml_ros2_plugin-release.git";
        rev = "19ec80de0e25500271e651a41f9ba00daa72cd41";
        hash = "sha256-yoKPHciam4zihyBcYUf/zrVk7LhG14peuJ3WXxLD9No=";
      };
    };
  });
  meta = {
    description = "A QML plugin for ROS. Enables full communication with ROS from QML.";
  };
})
