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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qml6_ros2_plugin";
  version = "4.26.40-1";
  src = finalAttrs.passthru.sources."qml6_ros2_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp image-transport rclcpp ros-babel-fish tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6-multimedia" "libqt6-qml" "libqt6-quick" "qt6-base-dev" "qt6-declarative-dev" "qt6-multimedia-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp image-transport rclcpp ros-babel-fish tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6-multimedia" "libqt6-qml" "libqt6-quick" "qt6-base-dev" "qt6-declarative-dev" "qt6-multimedia-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto example-interfaces ros-babel-fish-test-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml6-module-qtqml-workerscript" "qml6-module-qtquick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qml6_ros2_plugin" = substituteSource {
      src = fetchgit {
        name = "qml6_ros2_plugin-source";
        url = "https://github.com/ros2-gbp/qml6_ros2_plugin-release.git";
        rev = "7ea6e29c881108cfa96f87f1f47ad1b384da1ed9";
        hash = "sha256-3cSiMvlmg0B9K7lxKYxblcxP3DL+MIp7ORNBEzDRMyI=";
      };
    };
  });
  meta = {
    description = "\n    A QML plugin for ROS.\n    Enables full communication with ROS from QML.\n  ";
  };
})
