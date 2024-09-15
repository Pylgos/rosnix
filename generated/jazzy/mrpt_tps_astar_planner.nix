{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libnav,
  mrpt_libros_bridge,
  mrpt_msgs,
  mrpt_nav_interfaces,
  mrpt_path_planning,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    mrpt_tps_astar_planner = substituteSource {
      src = fetchgit {
        name = "mrpt_tps_astar_planner-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "b09edea0b49ea8041bf8c08c00005c344a7a80b4";
        hash = "sha256-5N/hVvzeLGczcCLvs7ltfxgWB9LOJeBflxVyxLQWKAg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tps_astar_planner";
  version = "2.1.1-1";
  src = sources.mrpt_tps_astar_planner;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mrpt_libgui mrpt_libmaps mrpt_libnav mrpt_libros_bridge mrpt_msgs mrpt_nav_interfaces mrpt_path_planning nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
}
