{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    py_trees_ros_interfaces = substituteSource {
      src = fetchgit {
        name = "py_trees_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/py_trees_ros_interfaces-release.git";
        rev = "461e14c922c6c5c08dac7346b43608f832d30045";
        hash = "sha256-QrixpzDzAj86KcSWBgYVI0CjrjuAtdFy7bMlEJgweaw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees_ros_interfaces";
  version = "2.1.0-4";
  src = sources.py_trees_ros_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs diagnostic_msgs geometry_msgs rosidl_default_runtime unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interfaces used by py_trees_ros and py_trees_ros_tutorials.";
  };
}
