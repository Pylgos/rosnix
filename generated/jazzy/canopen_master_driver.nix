{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  canopen_core,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    canopen_master_driver = substituteSource {
      src = fetchgit {
        name = "canopen_master_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
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
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_core canopen_interfaces lely_core_libraries rclcpp rclcpp_components rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Basic canopen master implementation";
  };
}
