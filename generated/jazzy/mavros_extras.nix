{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geographiclib,
  geometry_msgs,
  gtest,
  libmavconn,
  libyamlcpp,
  mavlink,
  mavros,
  mavros_msgs,
  message_filters,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  trajectory_msgs,
  urdf,
  visualization_msgs,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    mavros_extras = substituteSource {
      src = fetchgit {
        name = "mavros_extras-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "50cca906c0e232e86bae6f6311a6e2e59c0c9c3a";
        hash = "sha256-ed8UPRtqFOo6c7dGBvyW2v0z91P70cELsh5bH2xApKY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mavros_extras";
  version = "2.8.0-1";
  src = sources.mavros_extras;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater eigen eigen_stl_containers geographic_msgs geographiclib geometry_msgs libmavconn libyamlcpp mavlink mavros mavros_msgs message_filters nav_msgs pluginlib rclcpp rclcpp_components rcpputils rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs urdf visualization_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common gtest ];
  missingDependencies = [ "geographiclib-tools" ];
  meta = {
    description = "Extra nodes and plugins for";
  };
}
