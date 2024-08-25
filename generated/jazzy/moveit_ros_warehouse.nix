{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  warehouse_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_warehouse = substituteSource {
      src = fetchgit {
        name = "moveit_ros_warehouse-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c2a61092f73916e5537581377247478d8ca410d6";
        hash = "sha256-VOBxChpRFT62DKi68B+v/i7ZfgDIYLnkBbhfDFi8ck0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_warehouse";
  version = "2.10.0-1";
  src = sources.moveit_ros_warehouse;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt moveit_common moveit_core moveit_ros_planning rclcpp tf2_eigen tf2_ros warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Components of MoveIt connecting to MongoDB";
  };
}
