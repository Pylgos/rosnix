{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  rosSystemPackages,
  rosgraph_msgs,
  substituteSource,
  tf2,
  tf2_msgs,
}:
let
  sources = rec {
    tf2_ros-10a3a820949d0e09cbabff6c396a0d4f7ced4163 = substituteSource {
      src = fetchgit {
        name = "tf2_ros-10a3a820949d0e09cbabff6c396a0d4f7ced4163-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "10a3a820949d0e09cbabff6c396a0d4f7ced4163";
        hash = "sha256-ZnrXlbFoU/tpV3oVRCAjkypRda3o8UGWCBJHJVaM3FA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros";
  version = "0.36.4-1";
  src = sources.tf2_ros-10a3a820949d0e09cbabff6c396a0d4f7ced4163;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs message_filters rcl_interfaces rclcpp rclcpp_action rclcpp_components tf2 tf2_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosgraph_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package contains the C++ ROS bindings for the tf2 library";
  };
}
