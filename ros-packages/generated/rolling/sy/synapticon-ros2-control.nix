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
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."synapticon_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib rclcpp rclcpp-lifecycle robot-state-publisher ros2controlcli ros2launch xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "synapticon_ros2_control" = substituteSource {
      src = fetchgit {
        name = "synapticon_ros2_control-source";
        url = "https://github.com/ros2-gbp/synapticon_ros2_control-release.git";
        rev = "722bddb33b7edfa56fe1bebd5b46d76d694207d3";
        hash = "sha256-GbSweNwwtEBvELrBzIzKb1okS4uso+Kg3qVRS2WF7mY=";
      };
    };
  });
  meta = {
    description = "A ros2_control interface for Synapticon motor drivers";
  };
})
