{
  ament_cmake,
  ament_cmake_python,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz_sim = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "b7bce04e9ae9edb4c0caddb53e045e10f2dfd2ce";
        hash = "sha256-uo3B5mTmV8/fnrgmXyVyTJbvNRlVKomn/Vg0FqZx3TQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "2.0.1-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python gz_math_vendor gz_msgs_vendor gz_sim_vendor gz_transport_vendor launch launch_ros rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgflags-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
}
