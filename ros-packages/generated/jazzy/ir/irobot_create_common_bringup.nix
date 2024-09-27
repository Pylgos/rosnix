{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_python,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_control,
  irobot_create_description,
  irobot_create_nodes,
  joint_state_publisher,
  mkSourceSet,
  robot_state_publisher,
  ros2launch,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_common_bringup" = substituteSource {
      src = fetchgit {
        name = "irobot_create_common_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "bd99fd9c0355badce636104cfd147f706cfbd38c";
        hash = "sha256-xZk2IQByXC1uVYZgWUEWuv63eg4pLo3nwj3VGpWU0Vk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_common_bringup";
  version = "3.0.2-2";
  src = sources."irobot_create_common_bringup";
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ irobot_create_control irobot_create_description irobot_create_nodes joint_state_publisher robot_state_publisher ros2launch rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides common launch and configuration scripts for a simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
