{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "pilz_industrial_motion_planner_testutils" = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1ee78e5a7bedf0981632bed513ca786a1c0623d8";
        hash = "sha256-g4otOVNQUFukDBkgy7uvE1FJnmT2yWsR+kIKqDu7csQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.11.0-1";
  src = sources."pilz_industrial_motion_planner_testutils";
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