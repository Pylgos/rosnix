{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_robot_interaction = substituteSource {
      src = fetchgit {
        name = "moveit_ros_robot_interaction-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ddb05e33043712ce2b4d9f1fd8baaf8fbf7e494f";
        hash = "sha256-z8r+vWJe9V5E0HFgvUdAPpSxQN4woZl0l/ec5guTiDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_robot_interaction";
  version = "2.10.0-1";
  src = sources.moveit_ros_robot_interaction;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ interactive_markers moveit_common moveit_core moveit_ros_planning rclcpp tf2 tf2_eigen tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Components of MoveIt that offer interaction via interactive markers";
  };
}
