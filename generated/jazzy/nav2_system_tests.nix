{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  lcov,
  nav2_amcl,
  nav2_behavior_tree,
  nav2_bringup,
  nav2_common,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_minimal_tb3_sim,
  nav2_msgs,
  nav2_navfn_planner,
  nav2_planner,
  nav2_util,
  nav_msgs,
  navigation2,
  python3Packages,
  rclcpp,
  rclpy,
  robot_state_publisher,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    nav2_system_tests = substituteSource {
      src = fetchgit {
        name = "nav2_system_tests-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "43abf92c5582502f060188049cc4e43286b9afbe";
        hash = "sha256-CTFSyDlyX7rnQYTcOnYMAj5tSP/VckZJX6XZrplzPfg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_system_tests";
  version = "1.3.1-1";
  src = sources.nav2_system_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ lcov ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros launch_testing nav2_amcl nav2_behavior_tree nav2_bringup nav2_common nav2_lifecycle_manager nav2_map_server nav2_minimal_tb3_sim nav2_msgs nav2_navfn_planner nav2_planner nav2_util nav_msgs navigation2 rclcpp rclpy robot_state_publisher std_msgs tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing python3Packages.pyzmq ];
  missingDependencies = [  ];
  meta = {
    description = "A sets of system-level tests for Nav2 usually involving full robot simulation";
  };
}
