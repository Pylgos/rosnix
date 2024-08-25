{
  ament_cmake,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  std_srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlesim = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "dee596e8c4643aec9e5a6f93098371f93b5c8a02";
        hash = "sha256-+NwG+0EX/wiy8jFqWI7LoLitojrfxvVmRfY4duvQICU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim";
  version = "1.8.3-1";
  src = sources.turtlesim;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp geometry_msgs qt5.qtbase rcl_interfaces rclcpp rclcpp_action rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "turtlesim is a tool made for teaching ROS and ROS packages.";
  };
}
