{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  canopen_core,
  canopen_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    canopen_master_driver = substituteSource {
      src = fetchFromGitHub {
        name = "canopen_master_driver-source";
        owner = "ros2-gbp";
        repo = "ros2_canopen-release";
        rev = "f879ab2ee6a9a8d8fa4f75531daaff0d1f07375e";
        hash = "sha256-xzkjzzOaEItvb16SVik9+qsQVSauWVtMX/phwDXKdDk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_master_driver";
  version = "0.2.9-2";
  src = sources.canopen_master_driver;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_core canopen_interfaces lely_core_libraries rclcpp rclcpp_components rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Basic canopen master implementation";
  };
}
