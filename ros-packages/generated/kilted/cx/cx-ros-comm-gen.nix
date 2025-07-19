{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_ros_comm_gen";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_ros_comm_gen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-plugin cx-utils pluginlib rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-jinja2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-plugin cx-utils pluginlib rclcpp rclcpp-action ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cx_ros_comm_gen" = substituteSource {
      src = fetchgit {
        name = "cx_ros_comm_gen-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "72dd9dcacb343a52fe6c7eab1a082cbb1498621b";
        hash = "sha256-yw6JgbJ5mWiK2JRY/wO6MrK8ZBcILhpClPHxul1rhzs=";
      };
    };
  });
  meta = {
    description = "Generate CLIPS bindings to use ROS messages, actions and services";
  };
})
