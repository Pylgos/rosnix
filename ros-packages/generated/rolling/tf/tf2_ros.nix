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
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "tf2_ros" = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "f8849d12950b3d5dde2ace207ec64b8c309decc5";
        hash = "sha256-gQbMFE06osXv1mIWtZKgRg0yElH6T3CY/nqSNeeuK18=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tf2_ros";
  version = "0.38.2-1";
  src = sources."tf2_ros";
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
