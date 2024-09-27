{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_ros_visualization,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_app_plugins-ee56a0dcffa31745c28526cb65f1838c7be43b7b = substituteSource {
      src = fetchgit {
        name = "moveit_setup_app_plugins-ee56a0dcffa31745c28526cb65f1838c7be43b7b-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ee56a0dcffa31745c28526cb65f1838c7be43b7b";
        hash = "sha256-R2EfqBGaXZjN46MSrxtlZZ7YKUuwAuQJmKZATkyiHdQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_app_plugins";
  version = "2.11.0-1";
  src = sources.moveit_setup_app_plugins-ee56a0dcffa31745c28526cb65f1838c7be43b7b;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp moveit_configs_utils moveit_ros_visualization moveit_setup_framework pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Various specialty plugins for MoveIt Setup Assistant";
  };
}
