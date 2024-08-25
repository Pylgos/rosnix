{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  nlohmann_json,
  ompl,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_smac_planner = substituteSource {
      src = fetchgit {
        name = "nav2_smac_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "26ae0c267be0f96235111552c072bc41b0c462ce";
        hash = "sha256-4oKc3weGfBq2L8uo1iPErJj0CO8MxVnp9JQ5ffssSKk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smac_planner";
  version = "1.3.1-1";
  src = sources.nav2_smac_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles builtin_interfaces eigen geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs nlohmann_json ompl pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Smac global planning plugin: A*, Hybrid-A*, State Lattice";
  };
}
