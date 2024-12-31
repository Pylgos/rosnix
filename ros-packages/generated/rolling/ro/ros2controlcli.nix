{
  buildAmentPythonPackage,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2controlcli";
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "f75ba80c8e190a5203e6f7421e0d6c13a5133cf6";
        hash = "sha256-a+m7vUW5/VOT9xtNxtrwyG0Nyuj/7ST7hc56htyFCYA=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ROS2 Control.";
  };
})
