{
  ament_cmake,
  buildRosPackage,
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
    dual_arm_panda_moveit_config-33a3867196bbccfc7bc2b335b9a67e1452701bed = substituteSource {
      src = fetchgit {
        name = "dual_arm_panda_moveit_config-33a3867196bbccfc7bc2b335b9a67e1452701bed-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "33a3867196bbccfc7bc2b335b9a67e1452701bed";
        hash = "sha256-V71OPHp++p3BjHIOsZaorfCVHJWME4JIA7kB869Ruk0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dual_arm_panda_moveit_config";
  version = "3.0.0-3";
  src = sources.dual_arm_panda_moveit_config-33a3867196bbccfc7bc2b335b9a67e1452701bed;
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
