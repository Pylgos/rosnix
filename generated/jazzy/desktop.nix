{
  action_tutorials_cpp,
  action_tutorials_interfaces,
  action_tutorials_py,
  ament_cmake,
  angles,
  buildRosPackage,
  composition,
  demo_nodes_cpp,
  demo_nodes_cpp_native,
  demo_nodes_py,
  depthimage_to_laserscan,
  dummy_map_server,
  dummy_robot_bringup,
  dummy_sensors,
  examples_rclcpp_minimal_action_client,
  examples_rclcpp_minimal_action_server,
  examples_rclcpp_minimal_client,
  examples_rclcpp_minimal_composition,
  examples_rclcpp_minimal_publisher,
  examples_rclcpp_minimal_service,
  examples_rclcpp_minimal_subscriber,
  examples_rclcpp_minimal_timer,
  examples_rclcpp_multithreaded_executor,
  examples_rclpy_executors,
  examples_rclpy_minimal_action_client,
  examples_rclpy_minimal_action_server,
  examples_rclpy_minimal_client,
  examples_rclpy_minimal_publisher,
  examples_rclpy_minimal_service,
  examples_rclpy_minimal_subscriber,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_tools,
  intra_process_demo,
  joy,
  lifecycle,
  logging_demo,
  pcl_conversions,
  pendulum_control,
  pendulum_msgs,
  quality_of_service_demo_cpp,
  quality_of_service_demo_py,
  rosSystemPackages,
  ros_base,
  rqt_common_plugins,
  rviz2,
  rviz_default_plugins,
  substituteSource,
  teleop_twist_joy,
  teleop_twist_keyboard,
  tlsf,
  tlsf_cpp,
  topic_monitor,
  turtlesim,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    desktop = substituteSource {
      src = fetchFromGitHub {
        name = "desktop-source";
        owner = "ros2-gbp";
        repo = "variants-release";
        rev = "32f68b6baa355c7a47de783407f272843654644e";
        hash = "sha256-SDdRl/0AhXOo1iKjZqc+XABRaWTXxOE0fiLzJVFnvDY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop";
  version = "0.11.0-1";
  src = sources.desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_tutorials_cpp action_tutorials_interfaces action_tutorials_py angles composition demo_nodes_cpp demo_nodes_cpp_native demo_nodes_py depthimage_to_laserscan dummy_map_server dummy_robot_bringup dummy_sensors examples_rclcpp_minimal_action_client examples_rclcpp_minimal_action_server examples_rclcpp_minimal_client examples_rclcpp_minimal_composition examples_rclcpp_minimal_publisher examples_rclcpp_minimal_service examples_rclcpp_minimal_subscriber examples_rclcpp_minimal_timer examples_rclcpp_multithreaded_executor examples_rclpy_executors examples_rclpy_minimal_action_client examples_rclpy_minimal_action_server examples_rclpy_minimal_client examples_rclpy_minimal_publisher examples_rclpy_minimal_service examples_rclpy_minimal_subscriber image_tools intra_process_demo joy lifecycle logging_demo pcl_conversions pendulum_control pendulum_msgs quality_of_service_demo_cpp quality_of_service_demo_py ros_base rqt_common_plugins rviz2 rviz_default_plugins teleop_twist_joy teleop_twist_keyboard tlsf tlsf_cpp topic_monitor turtlesim ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package which extends 'ros_base' and includes high level packages like vizualization tools and demos.";
  };
}
