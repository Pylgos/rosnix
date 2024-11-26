{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  moveit-resources-panda-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  topic-tools,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dual_arm_panda_moveit_config";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."dual_arm_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "dual_arm_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "dual_arm_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "cb78588b1f49c9d1c78a0b791bd6a92735cbafff";
        hash = "sha256-V71OPHp++p3BjHIOsZaorfCVHJWME4JIA7kB869Ruk0=";
      };
    };
  });
  meta = {
    description = "";
  };
})
