{
  ament-cmake,
  buildAmentCmakePackage,
  clips-vendor,
  cx-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_ros_msgs_plugin";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_ros_msgs_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp rcutils rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libicu-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clips-vendor cx-plugin cx-utils pluginlib rclcpp rcutils rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libicu-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cx_ros_msgs_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_ros_msgs_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "987a7400020bebf1f9170d3dbceedb98fbed37c2";
        hash = "sha256-7zgnGxduclc7vC8hFPNlL+sD584bfGb/lZeGWjP6E6g=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin for using generic ROS topics via introspection API";
  };
})
