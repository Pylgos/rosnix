{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  launch_ros,
  launch_testing_ament_cmake,
  message_filters,
  mkSourceSet,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  yaml_cpp_vendor,
}:
let
  sources = mkSourceSet (sources: {
    "robot_localization" = substituteSource {
      src = fetchgit {
        name = "robot_localization-source";
        url = "https://github.com/ros2-gbp/robot_localization-release.git";
        rev = "d9a82c26115fb5aa2185daa1fb49a2273550a606";
        hash = "sha256-msp4BzyHMrZjhF4/2VpgHOzkGRXIArt0rqvqgiMLt9g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "robot_localization";
  version = "3.9.1-1";
  src = sources."robot_localization";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles builtin_interfaces diagnostic_msgs diagnostic_updater geographic_msgs geometry_msgs message_filters nav_msgs rclcpp rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_eigen tf2_geometry_msgs tf2_ros yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "libboost-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides nonlinear state estimation through sensor fusion of an abritrary number of sensors.";
  };
}
