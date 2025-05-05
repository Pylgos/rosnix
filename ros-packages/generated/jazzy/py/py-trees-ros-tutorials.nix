{
  action-msgs,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  mkSourceSet,
  py-trees,
  py-trees-ros,
  py-trees-ros-interfaces,
  rcl-interfaces,
  rclpy,
  ros2launch,
  ros2param,
  ros2run,
  ros2service,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_ros_tutorials";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."py_trees_ros_tutorials";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs launch launch-ros py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy ros2launch ros2param ros2run ros2service ros2topic sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyqt5-dev-tools" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  propagatedBuildInputs = [ action-msgs geometry-msgs launch launch-ros py-trees py-trees-ros py-trees-ros-interfaces rcl-interfaces rclpy ros2launch ros2param ros2run ros2service ros2topic sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pyqt5-dev-tools" "python3-qt5-bindings" "python3-setuptools" "qttools5-dev-tools" ]; };
  checkInputs = [ action-msgs py-trees py-trees-ros rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros_tutorials" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros_tutorials-source";
        url = "https://github.com/ros2-gbp/py_trees_ros_tutorials-release.git";
        rev = "173f15e2519b8242beadeabd7224c2d81b936b49";
        hash = "sha256-b2dIJKaTdDu5HDsxLUYMHu3fnfNwfzg9oqwDK8aI7B8=";
      };
    };
  });
  meta = {
    description = "\n    Tutorials for py_trees on ROS2.\n  ";
  };
})
