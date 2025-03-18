{
  ament-cmake,
  ament-cmake-gmock,
  angles,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  parameter-traits,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pid_controller";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."pid_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface parameter-traits pluginlib rclcpp rclcpp-lifecycle realtime-tools std-srvs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "pid_controller" = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "53ab56a18d022bc8347c3204c20408160241c407";
        hash = "sha256-2lGrW7pkAvd5ExTNhCRSHYFlMGX6KWyKjdgxLkvA35s=";
      };
    };
  });
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
})
