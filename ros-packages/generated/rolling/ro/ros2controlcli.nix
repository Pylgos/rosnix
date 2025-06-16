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
  version = "5.2.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "70b2e14da286775ab254caf9da97a66f0e32cb9e";
        hash = "sha256-KD5RPdXnTfdHaSABQMVHE45B7yI0g5QcIh8ne00LcK8=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ros2_control.";
  };
})
