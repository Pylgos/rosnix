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
  version = "2.25.2-2";
  src = finalAttrs.passthru.sources."qml_ros2_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp ];
  propagatedBuildInputs = [ image-transport rclcpp ros-babel-fish tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-multimedia" "libqt5-qml" "libqt5-quick" "qtbase5-dev" "qtdeclarative5-dev" "qtmultimedia5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto example-interfaces ros-babel-fish-test-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qml_ros2_plugin" = substituteSource {
      src = fetchgit {
        name = "qml_ros2_plugin-source";
        url = "https://github.com/ros2-gbp/qml_ros2_plugin-release.git";
        rev = "87e8da84afbf73419f25292bbb3234e0db39a200";
        hash = "sha256-uXUhksWztJs5dxbq4mmjKW9DWwDMzcm6G+yj5PkLaOE=";
      };
    };
  });
  meta = {
    description = "A QML plugin for ROS. Enables full communication with ROS from QML.";
  };
})
