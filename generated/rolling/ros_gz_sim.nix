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
  gflags,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  pkg-config,
  rclcpp,
  rclcpp_components,
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
        rev = "0d3e78ecf10fcef1d41031b4dcca94a89b47f26d";
        hash = "sha256-DoszLUX+WwRrxxqnqMyVlE2jfRXBvAp6pz7zOPE4mHM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "2.0.0-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake ament_cmake_python pkg-config wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python gflags gz_math_vendor gz_msgs_vendor gz_sim_vendor gz_transport_vendor launch launch_ros rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for using Gazebo Sim simulation with ROS.";
  };
}
