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
  libyamlcpp,
  qt5,
  rclcpp,
  ros_babel_fish,
  ros_babel_fish_test_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qml_ros2_plugin = substituteSource {
      src = fetchgit {
        name = "qml_ros2_plugin-source";
        url = "https://github.com/ros2-gbp/qml_ros2_plugin-release.git";
        rev = "26fb96c81e6b21a7197c21b96565c4d8a0558d9e";
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
  src = sources.qml_ros2_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp image_transport libyamlcpp qt5.qtbase qt5.qtdeclarative qt5.qtmultimedia rclcpp ros_babel_fish tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto example_interfaces ros_babel_fish_test_msgs std_srvs ];
  missingDependencies = [ "qml-module-qtquick2" ];
  meta = {
    description = "A QML plugin for ROS. Enables full communication with ROS from QML.";
  };
}
