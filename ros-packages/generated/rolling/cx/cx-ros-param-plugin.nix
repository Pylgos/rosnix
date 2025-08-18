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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_ros_param_plugin";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_ros_param_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-plugin cx-utils pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-plugin cx-utils pluginlib rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "cx_ros_param_plugin" = substituteSource {
      src = fetchgit {
        name = "cx_ros_param_plugin-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "289c4b5c312a35f2e6facdfd9cae4f35d9f698e0";
        hash = "sha256-R82cKM2DVYdJeoj1E412oqWmuoGk5KN/qRIXdUmlm8E=";
      };
    };
  });
  meta = {
    description = "CLIPS plugin to retrieve ROS params from own or other nodes";
  };
})
