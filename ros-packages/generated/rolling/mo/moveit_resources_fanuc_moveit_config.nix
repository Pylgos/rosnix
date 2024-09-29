{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  mkSourceSet,
  moveit_resources_fanuc_description,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "2f769a648d8da53a6857291a8f3a9338f78d0371";
        hash = "sha256-5W4dgdY+Kj2gphTOhUv2nAWi/hYFhI2zB855Sf5izOI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "3.0.0-2";
  src = sources."moveit_resources_fanuc_moveit_config";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description robot_state_publisher tf2_ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}