{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
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
        rev = "14431e55f4e2e38bb958601accffaedb9f05a7ad";
        hash = "sha256-N6Tml7BQoajjvvJSatRzrlyHNGdAeTRwY06DioxXmF8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tps_astar_planner";
  version = "2.2.0-1";
  src = sources.mrpt_tps_astar_planner;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mrpt_libgui mrpt_libmaps mrpt_libnav mrpt_libros_bridge mrpt_msgs mrpt_nav_interfaces mrpt_path_planning nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
}
