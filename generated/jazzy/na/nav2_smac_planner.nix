{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
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
  ompl,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_smac_planner-4e117a9a6da62c8502b0ca84f7a66d1fa1fd8867 = substituteSource {
      src = fetchgit {
        name = "nav2_smac_planner-4e117a9a6da62c8502b0ca84f7a66d1fa1fd8867-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4e117a9a6da62c8502b0ca84f7a66d1fa1fd8867";
        hash = "sha256-XPoM1zgQ8+Oi7SPouSGBnhxuRDCQyA4UmmNf46yn9y0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smac_planner";
  version = "1.3.2-1";
  src = sources.nav2_smac_planner-4e117a9a6da62c8502b0ca84f7a66d1fa1fd8867;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles builtin_interfaces geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs ompl pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Smac global planning plugin: A*, Hybrid-A*, State Lattice";
  };
}
