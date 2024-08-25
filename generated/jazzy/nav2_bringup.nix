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
        rev = "d5079dfa9dfb52dbc6fafb5fc7e37aef00e72e69";
        hash = "sha256-2AfHsTGLd0zIZa7CdbnOGKHHAM06sCT14Cy3H5Hzg4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_bringup";
  version = "1.3.1-1";
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
