{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  bondcpp,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_common,
  nav2_msgs,
  nav2_util,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_lifecycle_manager = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f01e8e6b6a8f0a38d43af2f3f14f5b1e26b06e50";
        hash = "sha256-IvyKGfmX6AcqrHboX+b9Hz0qx6T7emyz0rsJtkffICs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_lifecycle_manager";
  version = "1.3.1-1";
  src = sources.nav2_lifecycle_manager;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bondcpp diagnostic_updater geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A controller/manager for the lifecycle nodes of the Navigation 2 system";
  };
}
