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
    moveit_setup_core_plugins-46f3e46b144520f8f6ffa72521ed718e7eaff8b9 = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-46f3e46b144520f8f6ffa72521ed718e7eaff8b9-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "46f3e46b144520f8f6ffa72521ed718e7eaff8b9";
        hash = "sha256-zu0imYmCxzAZeYZhj925AlKQbSyYk3L+0kr0pIJkiyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_core_plugins";
  version = "2.10.0-1";
  src = sources.moveit_setup_core_plugins-46f3e46b144520f8f6ffa72521ed718e7eaff8b9;
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
