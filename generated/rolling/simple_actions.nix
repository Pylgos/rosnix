{
  action_msgs,
  action_tutorials_interfaces,
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    simple_actions = substituteSource {
      src = fetchgit {
        name = "simple_actions-source";
        url = "https://github.com/ros2-gbp/simple_actions-release.git";
        rev = "a7c1a14741bfdeff9bf7b7d7ae2bc1164f9f9ab7";
        hash = "sha256-BC5T9iKxbIolH0TXwEUcRhXO0b9xjFOdnM4+le2X27Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_actions";
  version = "0.4.0-1";
  src = sources.simple_actions;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rclcpp rclcpp_action rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ action_tutorials_interfaces ];
  missingDependencies = [  ];
  meta = {
    description = "Simple library for using the `rclpy/rclcpp` action libraries";
  };
}
