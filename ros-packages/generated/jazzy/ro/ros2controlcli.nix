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
  version = "4.38.0-1";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedNativeBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "6c3e95b9f5e573f9363e7aee482005b981d52501";
        hash = "sha256-lQ1vKyXO7e5lGWHpdwTHWYXk0yUIxXRys9YlVxV/0/w=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ros2_control.";
  };
})
