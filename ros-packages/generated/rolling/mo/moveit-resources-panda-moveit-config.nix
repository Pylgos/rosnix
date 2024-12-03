{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper-controllers,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-resources-panda-description,
  position-controllers,
  robot-state-publisher,
  ros2cli-common-extensions,
  rosSystemPackages,
  substituteSource,
  topic-tools,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_panda_moveit_config";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager gripper-controllers joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description position-controllers robot-state-publisher ros2cli-common-extensions topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "b8ecdda0e809acac2d34609791c2c8db52898ad5";
        hash = "sha256-C/ZYv7zZjt0Gf+bAOvkUHpfQCXRsprQzjQf4JaehvPc=";
      };
    };
  });
  meta = {
    description = "";
  };
})
