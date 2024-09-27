{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rosSystemPackages,
  ros_babel_fish,
  ros_babel_fish_test_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qml_ros2_plugin-19ec80de0e25500271e651a41f9ba00daa72cd41 = substituteSource {
      src = fetchgit {
        name = "qml_ros2_plugin-19ec80de0e25500271e651a41f9ba00daa72cd41-source";
        url = "https://github.com/ros2-gbp/qml_ros2_plugin-release.git";
        rev = "19ec80de0e25500271e651a41f9ba00daa72cd41";
        hash = "sha256-yoKPHciam4zihyBcYUf/zrVk7LhG14peuJ3WXxLD9No=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qml_ros2_plugin";
  version = "1.0.1-1";
  src = sources.qml_ros2_plugin-19ec80de0e25500271e651a41f9ba00daa72cd41;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp image_transport rclcpp ros_babel_fish tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-multimedia" "libqt5-qml" "libqt5-quick" "qtbase5-dev" "qtdeclarative5-dev" "qtmultimedia5-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto example_interfaces ros_babel_fish_test_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick2" ]; };
  meta = {
    description = "A QML plugin for ROS. Enables full communication with ROS from QML.";
  };
}
