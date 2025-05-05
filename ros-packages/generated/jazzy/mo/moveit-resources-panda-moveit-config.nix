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
  propagatedNativeBuildInputs = [ controller-manager gripper-controllers joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description position-controllers robot-state-publisher ros2cli-common-extensions topic-tools xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager gripper-controllers joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description position-controllers robot-state-publisher ros2cli-common-extensions topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "a54e17c7085d5eeed6175ae4f5dacd42823ee392";
        hash = "sha256-C/ZYv7zZjt0Gf+bAOvkUHpfQCXRsprQzjQf4JaehvPc=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
