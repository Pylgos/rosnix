{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_connextdds,
  rmw_cyclonedds_cpp,
  rmw_fastrtps_cpp,
  rmw_implementation_cmake,
  rosSystemPackages,
  rosbag2_cpp,
  rosgraph_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_typesupport_cpp,
  substituteSource,
  test_msgs,
  zstd_vendor,
}:
let
  sources = rec {
    domain_bridge = substituteSource {
      src = fetchgit {
        name = "domain_bridge-source";
        url = "https://github.com/ros2-gbp/domain_bridge-release.git";
        rev = "b791d5fffdc7651f2fa3300adb454ae5674b9e35";
        hash = "sha256-eajUFSE7L+45VSlUvbXcvd6RjjdERKimvpFjuXVbCO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_bridge";
  version = "0.5.0-4";
  src = sources.domain_bridge;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components rcutils rosbag2_cpp rosidl_default_runtime rosidl_typesupport_cpp zstd_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common example_interfaces launch launch_testing launch_testing_ament_cmake rmw_connextdds rmw_cyclonedds_cpp rmw_fastrtps_cpp rmw_implementation_cmake rosgraph_msgs test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 Domain Bridge";
  };
}
