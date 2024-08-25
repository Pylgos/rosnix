{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  moveit_resources_fanuc_description,
  robot_state_publisher,
  substituteSource,
  tf2_ros,
  xacro,
}:
let
  sources = rec {
    moveit_resources_fanuc_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "c5ed7e182a3c639bab928f65b63a4497ecd359db";
        hash = "sha256-5W4dgdY+Kj2gphTOhUv2nAWi/hYFhI2zB855Sf5izOI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "3.0.0-3";
  src = sources.moveit_resources_fanuc_moveit_config;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description robot_state_publisher tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "";
  };
}
