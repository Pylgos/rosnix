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
  version = "0.1.3-1";
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
        rev = "2fbde60f125931293f4e08840236e393400f55e0";
        hash = "sha256-4aWrUBGGMnHFqEI+ASjw714YruckXpwhbTJHD1wOQBs=";
      };
    };
  });
  meta = {
    description = "Generate CLIPS bindings to use ROS messages, actions and services";
  };
})
