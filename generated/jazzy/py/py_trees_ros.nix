{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  py_trees,
  py_trees_ros_interfaces,
  rcl_interfaces,
  rclpy,
  ros2topic,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros_py,
  unique_identifier_msgs,
}:
let
  sources = rec {
    py_trees_ros = substituteSource {
      src = fetchgit {
        name = "py_trees_ros-source";
        url = "https://github.com/ros2-gbp/py_trees_ros-release.git";
        rev = "0f8245cb708e3fc07f8209f20b16fae3ca339e4a";
        hash = "sha256-bJ7EieVdM2WQ6yRmsyC+RzLbx2zvlqBoVCWjuBVF8Yc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees_ros";
  version = "2.2.2-4";
  src = sources.py_trees_ros;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs py_trees py_trees_ros_interfaces rcl_interfaces rclpy ros2topic sensor_msgs std_msgs tf2_ros_py unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "ROS2 extensions and behaviours for py_trees.";
  };
}
