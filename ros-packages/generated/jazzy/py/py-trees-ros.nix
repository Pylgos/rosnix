{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  py-trees,
  py-trees-ros-interfaces,
  rcl-interfaces,
  rclpy,
  ros2topic,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros-py,
  unique-identifier-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_ros";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."py_trees_ros";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ geometry-msgs py-trees py-trees-ros-interfaces rcl-interfaces rclpy ros2topic sensor-msgs std-msgs std-srvs tf2-ros-py unique-identifier-msgs ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros-source";
        url = "https://github.com/ros2-gbp/py_trees_ros-release.git";
        rev = "5034b54474242f1452f6e6e1dfca284575c3b872";
        hash = "sha256-EwcOTCBdHOJfbna/19EWdvJiHnpWwmZZj1j/Rhc3H9g=";
      };
    };
  });
  meta = {
    description = "ROS2 extensions and behaviours for py_trees.";
  };
})
