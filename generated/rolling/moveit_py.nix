{
  ament_cmake,
  ament_cmake_pytest,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  octomap_msgs,
  pybind11_vendor,
  python3Packages,
  rclcpp,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_py = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e0c32f8d89a270a0b4cf423fcdfdc057123f72af";
        hash = "sha256-g7saOz9IdlSXYFhRUfWk6SF4+/6zNq8nFfHzfeWf2bo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_py";
  version = "2.10.0-1";
  src = sources.moveit_py;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python geometry_msgs moveit_core moveit_ros_planning moveit_ros_planning_interface octomap_msgs pybind11_vendor rclcpp rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python binding for MoveIt 2";
  };
}
