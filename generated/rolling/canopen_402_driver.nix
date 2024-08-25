{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_402_driver = substituteSource {
      src = fetchgit {
        name = "canopen_402_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "31f116fdfffe916d3a85196d90bd00a602ce0fc3";
        hash = "sha256-3e2q7BXoyMladOHb7nm1zkYY7NPtmzvWcQVM/LddZtA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_402_driver";
  version = "0.2.12-2";
  src = sources.canopen_402_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces canopen_proxy_driver python3Packages.boost rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Driiver for devices implementing CIA402 profile";
  };
}
