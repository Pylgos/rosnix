{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_amcl,
  nav2_behavior_tree,
  nav2_behaviors,
  nav2_bt_navigator,
  nav2_collision_monitor,
  nav2_constrained_smoother,
  nav2_controller,
  nav2_core,
  nav2_costmap_2d,
  nav2_dwb_controller,
  nav2_graceful_controller,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_mppi_controller,
  nav2_msgs,
  nav2_navfn_planner,
  nav2_planner,
  nav2_regulated_pure_pursuit_controller,
  nav2_rotation_shim_controller,
  nav2_rviz_plugins,
  nav2_simple_commander,
  nav2_smac_planner,
  nav2_smoother,
  nav2_theta_star_planner,
  nav2_util,
  nav2_velocity_smoother,
  nav2_voxel_grid,
  nav2_waypoint_follower,
  opennav_docking,
  opennav_docking_bt,
  opennav_docking_core,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    navigation2-1f6fe63357b776fe7d5c62d7d064ae59481e5fb2 = substituteSource {
      src = fetchgit {
        name = "navigation2-1f6fe63357b776fe7d5c62d7d064ae59481e5fb2-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "1f6fe63357b776fe7d5c62d7d064ae59481e5fb2";
        hash = "sha256-kamrg4rOT0yj2K3kGV5WyWbQyb3H+NJvAUalMWfGd7Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "navigation2";
  version = "1.3.2-1";
  src = sources.navigation2-1f6fe63357b776fe7d5c62d7d064ae59481e5fb2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav2_amcl nav2_behavior_tree nav2_behaviors nav2_bt_navigator nav2_collision_monitor nav2_constrained_smoother nav2_controller nav2_core nav2_costmap_2d nav2_dwb_controller nav2_graceful_controller nav2_lifecycle_manager nav2_map_server nav2_mppi_controller nav2_msgs nav2_navfn_planner nav2_planner nav2_regulated_pure_pursuit_controller nav2_rotation_shim_controller nav2_rviz_plugins nav2_simple_commander nav2_smac_planner nav2_smoother nav2_theta_star_planner nav2_util nav2_velocity_smoother nav2_voxel_grid nav2_waypoint_follower opennav_docking opennav_docking_bt opennav_docking_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 Navigation Stack";
  };
}
