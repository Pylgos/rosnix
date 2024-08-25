{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_ros,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    robotiq_description = substituteSource {
      src = fetchgit {
        name = "robotiq_description-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "491ee7d0eb1c3a99e101076d2f06e76d61679f46";
        hash = "sha256-CO6k93lrA+H92beTQuG1tnfMsO99+vpYtYXmfABHcr4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotiq_description";
  version = "0.0.1-2";
  src = sources.robotiq_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "URDF and xacro description package for the Robotiq gripper.";
  };
}
