{
  ament-cmake,
  ament-index-python,
  buildAmentCmakePackage,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_ros_comm_gen";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_ros_comm_gen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python cx-plugin cx-utils pluginlib rclcpp rclcpp-action rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-jinja2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python cx-plugin cx-utils pluginlib rclcpp rclcpp-action rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cx_ros_comm_gen" = substituteSource {
      src = fetchgit {
        name = "cx_ros_comm_gen-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "cd4a0dac81222f8453433e9c16cb5475c953947f";
        hash = "sha256-+018IQewjlE9EUbFcydCn4+RJWzmRQUTyQQWAjzX8pk=";
      };
    };
  });
  meta = {
    description = "Generate CLIPS bindings to use ROS messages, actions and services";
  };
})
