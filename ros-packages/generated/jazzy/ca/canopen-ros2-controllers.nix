{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  canopen-402-driver,
  canopen-interfaces,
  canopen-proxy-driver,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_ros2_controllers";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen-402-driver canopen-interfaces canopen-proxy-driver controller-interface controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-interfaces canopen-proxy-driver controller-interface controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "79054ac81c0db7f308843bfd2eabb56a14ee777c";
        hash = "sha256-N6K+Y5Zseu5kt3amsc7nR/a8+di+Ck5nucRfsqEbh2w=";
      };
    };
  });
  meta = {
    description = "ros2_control controllers for ros2_canopen functionalities";
  };
})
