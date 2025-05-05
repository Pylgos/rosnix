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
  propagatedNativeBuildInputs = [ rclcpp rclcpp-lifecycle ];
  propagatedBuildInputs = [ controller-manager forward-command-controller hardware-interface joint-state-broadcaster joint-trajectory-controller pluginlib robot-state-publisher ros2controlcli ros2launch xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcap-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "synapticon_ros2_control" = substituteSource {
      src = fetchgit {
        name = "synapticon_ros2_control-source";
        url = "https://github.com/synapticon/synapticon_ros2_control-release.git";
        rev = "9ae48752996ef00fa59e13a064a99ad682eb091a";
        hash = "sha256-GbSweNwwtEBvELrBzIzKb1okS4uso+Kg3qVRS2WF7mY=";
      };
    };
  });
  meta = {
    description = "A ros2_control interface for Synapticon motor drivers";
  };
})
