{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_eigen,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pilz_industrial_motion_planner_testutils = substituteSource {
      src = fetchFromGitHub {
        name = "pilz_industrial_motion_planner_testutils-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "e37a5de225970f5c0d697690238624890d61eade";
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
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_common moveit_core moveit_msgs rclcpp tf2_eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Helper scripts and functionality to test industrial motion generation";
  };
}
