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
  version = "4.21.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7c03bd7ac725257312e3d208350473a170f170a4";
        hash = "sha256-IeYG8LOrrXT5sDj8VincT7Y2Rljv5/yU5T+4TxTkI2s=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ROS2 Control.";
  };
})
