{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt2,
  mrpt_msgs,
  mrpt_nav_interfaces,
  mrpt_path_planning,
  nav_msgs,
  rclcpp,
  rclcpp_components,
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
        rev = "0b0ec82b42ef7936854c3364a5bbeb53e121a08a";
        hash = "sha256-+xIdHigGOeYhStZvU6JTqsJSMbUKAoYId4+/Lct/eTw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tps_astar_planner";
  version = "2.1.0-1";
  src = sources.mrpt_tps_astar_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mrpt2 mrpt_msgs mrpt_nav_interfaces mrpt_path_planning nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS Path Planner with A* in TP-Space Engine";
  };
}
