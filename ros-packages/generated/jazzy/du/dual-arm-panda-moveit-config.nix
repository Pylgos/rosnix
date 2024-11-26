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
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."dual_arm_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher topic-tools xacro ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dual_arm_panda_moveit_config" = substituteSource {
        src = fetchgit {
          name = "dual_arm_panda_moveit_config-source";
          url = "https://github.com/ros2-gbp/moveit_resources-release.git";
          rev = "33a3867196bbccfc7bc2b335b9a67e1452701bed";
          hash = "sha256-V71OPHp++p3BjHIOsZaorfCVHJWME4JIA7kB869Ruk0=";
        };
      };
    });
  };
  meta = {
    description = "";
  };
})
