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
  rosSystemPackages,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_proxy_driver-d3130ee628e1deb37ae6b3e2f273d2f56e59dc9f = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-d3130ee628e1deb37ae6b3e2f273d2f56e59dc9f-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "d3130ee628e1deb37ae6b3e2f273d2f56e59dc9f";
        hash = "sha256-9VxrJeE2dvYh55IGbOTts51CA4ogHdj9GVdvEOwf4q8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_proxy_driver";
  version = "0.2.12-2";
  src = sources.canopen_proxy_driver-d3130ee628e1deb37ae6b3e2f273d2f56e59dc9f;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Simple proxy driver for the ros2_canopen stack";
  };
}
