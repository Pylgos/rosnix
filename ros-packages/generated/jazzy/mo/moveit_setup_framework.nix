{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit_common,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_visualization,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz_common,
  rviz_rendering,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_setup_framework" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_framework-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "376bde171f1210b2bdf29dbc2324eea288f02bbf";
        hash = "sha256-11UWNQcUX87xuOSYir0gcYs+rkUvPXMNp7PXBwErVCg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_setup_framework";
  version = "2.10.0-1";
  src = sources."moveit_setup_framework";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp moveit_common moveit_core moveit_ros_planning moveit_ros_visualization pluginlib rclcpp rviz_common rviz_rendering srdfdom urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ Interface for defining setup steps for MoveIt Setup Assistant";
  };
}
