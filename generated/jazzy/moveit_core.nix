{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_index_cpp,
  angles,
  buildRosPackage,
  common_interfaces,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchFromGitHub,
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
  pluginlib,
  random_numbers,
  rcl_interfaces,
  rclcpp,
  rclpy,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "moveit_core-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "4ddbf0913eeb711c68b916e71d92c144500892da";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module google_benchmark_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles common_interfaces eigen_stl_containers generate_parameter_library geometric_shapes geometry_msgs kdl_parser moveit_common moveit_msgs octomap_msgs osqp_vendor pluginlib random_numbers rclcpp rsl ruckig sensor_msgs shape_msgs srdfdom std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_kdl trajectory_msgs urdf urdfdom urdfdom_headers visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "boost" "bullet" "eigen" "libfcl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_google_benchmark ament_cmake_gtest ament_index_cpp angles launch_testing_ament_cmake moveit_resources_panda_moveit_config moveit_resources_pr2_description orocos_kdl_vendor rcl_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Core libraries used by MoveIt";
  };
}
