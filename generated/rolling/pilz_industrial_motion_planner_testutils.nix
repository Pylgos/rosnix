{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_msgs,
  rclcpp,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pilz_industrial_motion_planner_testutils = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3c04b541744ad98302848eedc2fbd7295a530870";
        hash = "sha256-7WiArC/gMWnzY2VBbU2qqYwXwxvBo7+1yo9oyX/SB0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.10.0-1";
  src = sources.pilz_industrial_motion_planner_testutils;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_msgs rclcpp tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
}
