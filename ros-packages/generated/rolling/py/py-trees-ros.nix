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
  substituteSource,
  tf2-ros-py,
  unique-identifier-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "py_trees_ros";
  version = "2.2.2-3";
  src = finalAttrs.passthru.sources."py_trees_ros";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ geometry-msgs py-trees py-trees-ros-interfaces rcl-interfaces rclpy ros2topic sensor-msgs std-msgs tf2-ros-py unique-identifier-msgs ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "py_trees_ros" = substituteSource {
      src = fetchgit {
        name = "py_trees_ros-source";
        url = "https://github.com/ros2-gbp/py_trees_ros-release.git";
        rev = "b4cdc6d7ea9d814d6a40bffd98a14fc44e03e596";
        hash = "sha256-bJ7EieVdM2WQ6yRmsyC+RzLbx2zvlqBoVCWjuBVF8Yc=";
      };
    };
  });
  meta = {
    description = "ROS2 extensions and behaviours for py_trees.";
  };
})
