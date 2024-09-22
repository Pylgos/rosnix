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
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  libmavconn,
  mavlink,
  mavros,
  mavros_msgs,
  message_filters,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "mavros_extras-source";
        owner = "ros2-gbp";
        repo = "mavros-release";
        rev = "f5d44e45e407f1ec4f7b1acfc72902b2c58dfed7";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles diagnostic_msgs diagnostic_updater eigen_stl_containers geographic_msgs geometry_msgs libmavconn mavlink mavros mavros_msgs message_filters nav_msgs pluginlib rclcpp rclcpp_components rcpputils rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs urdf visualization_msgs yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  meta = {
    description = "Extra nodes and plugins for";
  };
}
