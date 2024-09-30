{
  ament-cmake,
  ament-cmake-gmock,
  buildRosPackage,
  canopen-402-driver,
  canopen-interfaces,
  canopen-proxy-driver,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "canopen_ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "6d54a85e5ba27d48ce477bfed1f7ea3e8d562c71";
        hash = "sha256-5O9E0FDjrfSvUzW0vP+MnP8FH9dnDmUiiCmJL+7nJ78=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "canopen_ros2_controllers";
  version = "0.2.12-2";
  src = sources."canopen_ros2_controllers";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen-402-driver canopen-interfaces canopen-proxy-driver controller-interface controller-manager hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control controllers for ros2_canopen functionalities";
  };
}
