{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  webots-ros2-driver,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "webots_ros2_control";
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle webots-ros2-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_control" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "2b55cc6319f94d2514dcc70e2194d0a2f9832674";
        hash = "sha256-308nQfaFsZcH7yn9lUmPQGhXHV0gbQZQk/4YqpZv6cc=";
      };
    };
  });
  meta = {
    description = "ros2_control plugin for Webots";
  };
})
