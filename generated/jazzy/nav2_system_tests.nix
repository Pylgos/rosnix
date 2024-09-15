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
  rclcpp,
  rclpy,
  robot_state_publisher,
  rosSystemPackages,
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
        rev = "bef514990f02073e6c93fec5fb9d4d9922d1e2be";
        hash = "sha256-ucri0sBHAoyNytUvQdVTK60YwgsLJk8OzyA5m0z+6wE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_system_tests";
  version = "1.3.2-1";
  src = sources.nav2_system_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lcov" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs launch_ros launch_testing nav2_amcl nav2_behavior_tree nav2_bringup nav2_common nav2_lifecycle_manager nav2_map_server nav2_minimal_tb3_sim nav2_msgs nav2_navfn_planner nav2_planner nav2_util nav_msgs navigation2 rclcpp rclpy robot_state_publisher std_msgs tf2_geometry_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_ros launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-zmq" ]; };
  meta = {
    description = "A sets of system-level tests for Nav2 usually involving full robot simulation";
  };
}
