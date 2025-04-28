{
  action-tutorials-cpp,
  action-tutorials-py,
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  composition,
  demo-nodes-cpp,
  demo-nodes-cpp-native,
  demo-nodes-py,
  depthimage-to-laserscan,
  dummy-map-server,
  dummy-robot-bringup,
  dummy-sensors,
  examples-rclcpp-minimal-action-client,
  examples-rclcpp-minimal-action-server,
  examples-rclcpp-minimal-client,
  examples-rclcpp-minimal-composition,
  examples-rclcpp-minimal-publisher,
  examples-rclcpp-minimal-service,
  examples-rclcpp-minimal-subscriber,
  examples-rclcpp-minimal-timer,
  examples-rclcpp-multithreaded-executor,
  examples-rclpy-executors,
  examples-rclpy-minimal-action-client,
  examples-rclpy-minimal-action-server,
  examples-rclpy-minimal-client,
  examples-rclpy-minimal-publisher,
  examples-rclpy-minimal-service,
  examples-rclpy-minimal-subscriber,
  fetchgit,
  fetchurl,
  fetchzip,
  image-tools,
  intra-process-demo,
  joy,
  lifecycle,
  logging-demo,
  mkSourceSet,
  pcl-conversions,
  pendulum-control,
  pendulum-msgs,
  quality-of-service-demo-cpp,
  quality-of-service-demo-py,
  ros-base,
  rosSystemPackages,
  rqt-common-plugins,
  rviz-default-plugins,
  rviz2,
  substituteSource,
  teleop-twist-joy,
  teleop-twist-keyboard,
  tlsf,
  tlsf-cpp,
  topic-monitor,
  turtlesim,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "desktop";
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ action-tutorials-cpp action-tutorials-py angles composition demo-nodes-cpp demo-nodes-cpp-native demo-nodes-py depthimage-to-laserscan dummy-map-server dummy-robot-bringup dummy-sensors examples-rclcpp-minimal-action-client examples-rclcpp-minimal-action-server examples-rclcpp-minimal-client examples-rclcpp-minimal-composition examples-rclcpp-minimal-publisher examples-rclcpp-minimal-service examples-rclcpp-minimal-subscriber examples-rclcpp-minimal-timer examples-rclcpp-multithreaded-executor examples-rclpy-executors examples-rclpy-minimal-action-client examples-rclpy-minimal-action-server examples-rclpy-minimal-client examples-rclpy-minimal-publisher examples-rclpy-minimal-service examples-rclpy-minimal-subscriber image-tools intra-process-demo joy lifecycle logging-demo pcl-conversions pendulum-control pendulum-msgs quality-of-service-demo-cpp quality-of-service-demo-py ros-base rqt-common-plugins rviz2 rviz-default-plugins teleop-twist-joy teleop-twist-keyboard tlsf tlsf-cpp topic-monitor turtlesim ];
  passthru.sources = mkSourceSet (sources: {
    "desktop" = substituteSource {
      src = fetchgit {
        name = "desktop-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "1c695947b0f52cf0136e2e67e42d827278605187";
        hash = "sha256-QP5wIK7n2vNPv7xkAd7KJVWw9LxTLvsF59Lf+lfxwas=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes high level packages like vizualization tools and demos.";
  };
})
