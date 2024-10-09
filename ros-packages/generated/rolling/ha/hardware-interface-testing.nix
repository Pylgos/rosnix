{
  ament-cmake,
  ament-cmake-gmock,
  buildRosPackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "6444959f8869102cb8cf66ddb2e0dfd59e8ee1e0";
        hash = "sha256-yvKQv0WZZ/kN+p6eD9RrfklZHSC3RQolkOqLi1xMoUc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "hardware_interface_testing";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."hardware_interface_testing";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control-msgs hardware-interface lifecycle-msgs pluginlib rclcpp-lifecycle ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ros2_control hardware interface testing";
  };
})
