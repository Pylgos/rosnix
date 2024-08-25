{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  launch_ros,
  robot_state_publisher,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    urdf_launch = substituteSource {
      src = fetchgit {
        name = "urdf_launch-source";
        url = "https://github.com/ros2-gbp/urdf_launch-release.git";
        rev = "720838f2c65e468e850c50069f8689faa23f125a";
        hash = "sha256-culhEaUIVzEURBnbx83ibUd3MceQsW3fVCfO2lKvIEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_launch";
  version = "0.1.1-3";
  src = sources.urdf_launch;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui launch_ros robot_state_publisher rviz2 rviz_common rviz_default_plugins xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Launch files for common URDF operations";
  };
}
