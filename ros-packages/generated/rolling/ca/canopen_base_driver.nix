{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_core,
  canopen_interfaces,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
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
    canopen_base_driver-9859a879293e50482671abe2f2ff1a00b0583b3e = substituteSource {
      src = fetchgit {
        name = "canopen_base_driver-9859a879293e50482671abe2f2ff1a00b0583b3e-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "9859a879293e50482671abe2f2ff1a00b0583b3e";
        hash = "sha256-qQSkdcUbRyYlVrvDoRqGRncdaToAyjnhTYEfS6tMNak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_base_driver";
  version = "0.2.12-2";
  src = sources.canopen_base_driver-9859a879293e50482671abe2f2ff1a00b0583b3e;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_core canopen_interfaces diagnostic_updater lely_core_libraries rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Library containing abstract CANopen driver class for ros2_canopen";
  };
}
