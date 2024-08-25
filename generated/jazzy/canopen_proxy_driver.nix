{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_proxy_driver = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "d5c0e9c04f634b1cada8a043355ee09a13fd294e";
        hash = "sha256-QwLvJwY8xrI+FKlIKORTwDnTRlrWA8r1hx7IQbDoTmA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_proxy_driver";
  version = "0.2.9-2";
  src = sources.canopen_proxy_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Simple proxy driver for the ros2_canopen stack";
  };
}
