{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  nav2_minimal_tb3_sim,
  nav2_minimal_tb4_sim,
  navigation2,
  ros_gz_bridge,
  ros_gz_sim,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    nav2_bringup = substituteSource {
      src = fetchgit {
        name = "nav2_bringup-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3ed52d2e3b71b48b5f0141e0c4475baf17770d08";
        hash = "sha256-Deg2qAY6VvKeHrjquPFWHy8FbL6BRP3LR1hQWoJsHNk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bringup";
  version = "1.3.2-1";
  src = sources.nav2_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diff_drive_controller joint_state_broadcaster launch_ros nav2_common nav2_minimal_tb3_sim nav2_minimal_tb4_sim navigation2 ros_gz_bridge ros_gz_sim slam_toolbox xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Bringup scripts and configurations for the Nav2 stack";
  };
}
