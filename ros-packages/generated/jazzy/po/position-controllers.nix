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
    "position_controllers" = substituteSource {
      src = fetchgit {
        name = "position_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "a95b211afeefe9226c8de77a5a6f0ac5850aa54a";
        hash = "sha256-4xB6xG5AyPElwPUSIYyL96i8cDxFNYF94xC3aDrZojY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "position_controllers";
  version = "4.14.0-1";
  src = sources."position_controllers";
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
