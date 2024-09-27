{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_ros_visualization,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_core_plugins-bd0141abc920977794b572dd4c8609aa52ccdd57 = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-bd0141abc920977794b572dd4c8609aa52ccdd57-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bd0141abc920977794b572dd4c8609aa52ccdd57";
        hash = "sha256-HTRXcGwdonmuWNi0SlLARwvAlqfhyzatQih6XFKXlPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_core_plugins";
  version = "2.11.0-1";
  src = sources.moveit_setup_core_plugins-bd0141abc920977794b572dd4c8609aa52ccdd57;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp moveit_ros_visualization moveit_setup_framework pluginlib rclcpp srdfdom urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
}
