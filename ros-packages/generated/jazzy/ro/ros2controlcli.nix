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
  version = "4.28.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "44aa88190479705fdbac0afd5c2287d10fb50835";
        hash = "sha256-rJnzhkiGsR6FMO1r67QP5cj3ciA0ulqPlDyL90yclHI=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ros2_control.";
  };
})
