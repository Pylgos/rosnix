{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildRosPackage,
  builtin-interfaces,
  control-msgs,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  urdf,
}:
let
  sources = mkSourceSet (sources: {
    "joint_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "joint_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "aadfffbf0b7be9d59874dbef2815a4bc4fc5d3b6";
        hash = "sha256-+BO2Dh/oDhZ+sBl088PrkbvR+7sGBZJIkXn5h3kBE1I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "joint_state_broadcaster";
  version = "4.15.0-1";
  src = finalAttrs.passthru.sources."joint_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing rclcpp ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Broadcaster to publish joint state";
  };
})
