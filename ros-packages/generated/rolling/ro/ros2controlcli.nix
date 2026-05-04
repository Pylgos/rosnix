{
  buildAmentPythonPackage,
  control-msgs,
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
  version = "6.7.0-2";
  src = finalAttrs.passthru.sources."ros2controlcli";
  propagatedNativeBuildInputs = [ control-msgs controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-pygraphviz" ]; };
  propagatedBuildInputs = [ control-msgs controller-manager controller-manager-msgs rcl-interfaces rclpy ros2cli ros2node ros2param rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pygraphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2controlcli" = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "4a02dd972be677a5df3c9a5b5095f0bcebab36e9";
        hash = "sha256-bZ1Xg0PflBnLKjg+wqJgPw6LbQ6SEWpJYJglRrW+mOI=";
      };
    };
  });
  meta = {
    description = "The ROS 2 command line tools for ros2_control.";
  };
})
