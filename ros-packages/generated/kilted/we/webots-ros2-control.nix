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
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle ros-environment webots-ros2-driver ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle ros-environment webots-ros2-driver ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_control" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_control-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "6041c5f24e64f269aaacd5c3d8dafe4099138399";
        hash = "sha256-Ykdz3BOjOPBEeiB+kN9jG2kCbd+aUVbxFKD2DAGnm54=";
      };
    };
  });
  meta = {
    description = "ros2_control plugin for Webots";
  };
})
