{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "synapticon_ros2_control";
  version = "0.1.2-2";
  src = finalAttrs.passthru.sources."synapticon_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcap-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "synapticon_ros2_control" = substituteSource {
      src = fetchgit {
        name = "synapticon_ros2_control-source";
        url = "https://github.com/ros2-gbp/synapticon_ros2_control-release.git";
        rev = "b2d2a6789252d6c4ac235771a711b62bb26cf41a";
        hash = "sha256-GbSweNwwtEBvELrBzIzKb1okS4uso+Kg3qVRS2WF7mY=";
      };
    };
  });
  meta = {
    description = "A ros2_control interface for Synapticon motor drivers";
  };
})
