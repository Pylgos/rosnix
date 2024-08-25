{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_index_cpp,
  angles,
  assimp,
  buildRosPackage,
  bullet,
  common_interfaces,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fcl,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometric_shapes,
  geometry_msgs,
  google_benchmark_vendor,
  kdl_parser,
  launch_testing_ament_cmake,
  moveit_common,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_resources_pr2_description,
  octomap_msgs,
  orocos_kdl_vendor,
  osqp_vendor,
  pkg-config,
  pluginlib,
  python3Packages,
  random_numbers,
  rcl_interfaces,
  rclcpp,
  rclpy,
  rsl,
  ruckig,
  sensor_msgs,
  shape_msgs,
  srdfdom,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_kdl,
  trajectory_msgs,
  urdf,
  urdfdom,
  urdfdom_headers,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_core = substituteSource {
      src = fetchgit {
        name = "moveit_core-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "91e0716ef2e2b5d62c04fe0bf4157c0173ed43ec";
        hash = "sha256-WwWn+S+POgbqVVFiTNS9YCPW4HwH0UtkvCrAYRmEuIE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_core";
  version = "2.10.0-1";
  src = sources.moveit_core;
  nativeBuildInputs = [ ament_cmake pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module google_benchmark_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles assimp bullet common_interfaces eigen eigen_stl_containers fcl generate_parameter_library geometric_shapes geometry_msgs kdl_parser moveit_common moveit_msgs octomap_msgs osqp_vendor pluginlib python3Packages.boost random_numbers rclcpp rsl ruckig sensor_msgs shape_msgs srdfdom std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_kdl trajectory_msgs urdf urdfdom urdfdom_headers visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_google_benchmark ament_cmake_gtest ament_index_cpp angles launch_testing_ament_cmake moveit_resources_panda_moveit_config moveit_resources_pr2_description orocos_kdl_vendor rcl_interfaces rclpy ];
  missingDependencies = [  ];
  meta = {
    description = "Core libraries used by MoveIt";
  };
}
