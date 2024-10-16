{
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-trajectory-controller,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  ur-dashboard-msgs,
  ur-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "a693737270a1eb0bc9ab3b4e967a5fb695187c07";
        hash = "sha256-EGYKP6qTZo+5XHY14pP0mnT2ZYP+nAvT9wR+VmxDdP4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_controllers";
  version = "2.4.12-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles controller-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs ur-dashboard-msgs ur-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
