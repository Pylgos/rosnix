{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_proc,
  leo_description,
  leo_fw,
  robot_state_publisher,
  rosSystemPackages,
  rosapi,
  rosbridge_server,
  sensor_msgs,
  substituteSource,
  v4l2_camera,
  xacro,
}:
let
  sources = rec {
    leo_bringup = substituteSource {
      src = fetchFromGitHub {
        name = "leo_bringup-source";
        owner = "ros2-gbp";
        repo = "leo_robot-release";
        rev = "154a4f309420538c58de02ee7b89b87c39a8c43a";
        hash = "sha256-L+gWo7c5nMDO1ro4o4wCIQuFWuJzcQOQKBKcJOdViwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_bringup";
  version = "1.4.0-2";
  src = sources.leo_bringup;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs image_proc leo_description leo_fw robot_state_publisher rosapi rosbridge_server sensor_msgs v4l2_camera xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Scripts and launch files for starting basic Leo Rover functionalities.";
  };
}
