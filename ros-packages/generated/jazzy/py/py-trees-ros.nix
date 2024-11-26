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
  version = "2.2.2-4";
  src = finalAttrs.passthru.sources."py_trees_ros";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedBuildInputs = [ geometry-msgs py-trees py-trees-ros-interfaces rcl-interfaces rclpy ros2topic sensor-msgs std-msgs tf2-ros-py unique-identifier-msgs ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "py_trees_ros" = substituteSource {
        src = fetchgit {
          name = "py_trees_ros-source";
          url = "https://github.com/ros2-gbp/py_trees_ros-release.git";
          rev = "0f8245cb708e3fc07f8209f20b16fae3ca339e4a";
          hash = "sha256-bJ7EieVdM2WQ6yRmsyC+RzLbx2zvlqBoVCWjuBVF8Yc=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 extensions and behaviours for py_trees.";
  };
})
