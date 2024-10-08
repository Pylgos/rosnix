{
  ament-cmake,
  ament-cmake-gmock,
  angles,
  backward-ros,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "pid_controller" = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "29162756746fb86de5553badd81db4303ff6cd1c";
        hash = "sha256-Zmo4CT99EGwZBSmGPDpWm3X0pGf0G+32Y3BVn5W+UPY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "pid_controller";
  version = "4.15.0-1";
  src = finalAttrs.passthru.sources."pid_controller";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface parameter-traits pluginlib rclcpp rclcpp-lifecycle realtime-tools std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
})
