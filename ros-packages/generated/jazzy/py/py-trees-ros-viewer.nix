{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  py-trees-js,
  py-trees-ros-interfaces,
  rclpy,
  rosSystemPackages,
  substituteSource,
  unique-identifier-msgs,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_ros_viewer";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."py_trees_ros_viewer";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ py-trees-js py-trees-ros-interfaces rclpy unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pyqt5-dev-tools" "python3-pyqt5.qtwebengine" "python3-qt5-bindings" "qttools5-dev-tools" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros_viewer" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros_viewer-source";
        url = "https://github.com/ros2-gbp/py_trees_ros_viewer-release.git";
        rev = "316800ba129a6b0c211b661fc8d5b8bf1473c9b2";
        hash = "sha256-eoBNKHi0APYOkEfQDy5oGZeBmBif2rhwUhg3/ggkI2A=";
      };
    };
  });
  meta = {
    description = "A Qt-JS application for visualisation of executing/log-replayed behaviour trees in a ROS2 ecosystem.";
  };
})