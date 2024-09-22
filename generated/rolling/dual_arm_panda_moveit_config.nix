{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  moveit_resources_panda_description,
  robot_state_publisher,
  rosSystemPackages,
  substituteSource,
  topic_tools,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    dual_arm_panda_moveit_config = substituteSource {
      src = fetchFromGitHub {
        name = "dual_arm_panda_moveit_config-source";
        owner = "ros2-gbp";
        repo = "moveit_resources-release";
        rev = "cb78588b1f49c9d1c78a0b791bd6a92735cbafff";
        hash = "sha256-V71OPHp++p3BjHIOsZaorfCVHJWME4JIA7kB869Ruk0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dual_arm_panda_moveit_config";
  version = "3.0.0-2";
  src = sources.dual_arm_panda_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_resources_panda_description robot_state_publisher topic_tools xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
