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
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_402_driver-101f303cc30684d76e09bbfbfb90a6cdcebc361b = substituteSource {
      src = fetchgit {
        name = "canopen_402_driver-101f303cc30684d76e09bbfbfb90a6cdcebc361b-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "101f303cc30684d76e09bbfbfb90a6cdcebc361b";
        hash = "sha256-jzPNcmFGqFCQ+Iu0skkeiXVNfNC1s6nZO6zBvTw+p7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_402_driver";
  version = "0.2.9-2";
  src = sources.canopen_402_driver-101f303cc30684d76e09bbfbfb90a6cdcebc361b;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces canopen_proxy_driver rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driiver for devices implementing CIA402 profile";
  };
}
