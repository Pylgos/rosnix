{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  canopen_402_driver,
  canopen_core,
  canopen_fake_slaves,
  canopen_proxy_driver,
  canopen_ros2_controllers,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  joint_state_broadcaster,
  joint_trajectory_controller,
  lely_core_libraries,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    canopen_tests = substituteSource {
      src = fetchgit {
        name = "canopen_tests-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "78c9872e36b6324e4b7205c26514913a080e7457";
        hash = "sha256-EkeoqHvzJh37Ww+zQZTK1eekm6/McZUYyhTryDxNFMo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_tests";
  version = "0.2.12-2";
  src = sources.canopen_tests;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_fake_slaves canopen_proxy_driver canopen_ros2_controllers controller_manager forward_command_controller joint_state_broadcaster joint_trajectory_controller lely_core_libraries robot_state_publisher xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package with tests for ros2_canopen";
  };
}
