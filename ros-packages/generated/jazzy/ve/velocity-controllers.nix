{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildRosPackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "velocity_controllers" = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "8aa37491e45ece91eab46754d096a5bb0fae67d4";
        hash = "sha256-PWviUVk+O8BPR1IjaQ7q0K8dZueuBJMGfPjJuuh2ohg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "4.14.0-1";
  src = sources."velocity_controllers";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generic controller for forwarding commands.";
  };
}
