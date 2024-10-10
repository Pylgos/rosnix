{
  action-tutorials-cpp,
  action-tutorials-interfaces,
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
let
  sources = mkSourceSet (sources: {
    "desktop" = substituteSource {
      src = fetchgit {
        name = "desktop-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "32f68b6baa355c7a47de783407f272843654644e";
        hash = "sha256-SDdRl/0AhXOo1iKjZqc+XABRaWTXxOE0fiLzJVFnvDY=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "desktop";
  version = "0.11.0-1";
  src = finalAttrs.passthru.sources."desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-tutorials-cpp action-tutorials-interfaces action-tutorials-py angles composition demo-nodes-cpp demo-nodes-cpp-native demo-nodes-py depthimage-to-laserscan dummy-map-server dummy-robot-bringup dummy-sensors examples-rclcpp-minimal-action-client examples-rclcpp-minimal-action-server examples-rclcpp-minimal-client examples-rclcpp-minimal-composition examples-rclcpp-minimal-publisher examples-rclcpp-minimal-service examples-rclcpp-minimal-subscriber examples-rclcpp-minimal-timer examples-rclcpp-multithreaded-executor examples-rclpy-executors examples-rclpy-minimal-action-client examples-rclpy-minimal-action-server examples-rclpy-minimal-client examples-rclpy-minimal-publisher examples-rclpy-minimal-service examples-rclpy-minimal-subscriber image-tools intra-process-demo joy lifecycle logging-demo pcl-conversions pendulum-control pendulum-msgs quality-of-service-demo-cpp quality-of-service-demo-py ros-base rqt-common-plugins rviz2 rviz-default-plugins teleop-twist-joy teleop-twist-keyboard tlsf tlsf-cpp topic-monitor turtlesim ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "A package which extends 'ros_base' and includes high level packages like vizualization tools and demos.";
  };
})
