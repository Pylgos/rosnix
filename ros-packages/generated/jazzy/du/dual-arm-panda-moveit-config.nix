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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."dual_arm_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "dual_arm_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "dual_arm_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "5aa489f0fb8e8d5f2b65ee159e9d135fcbf1473e";
        hash = "sha256-MVimAZvyGt5W40Haya66Kn0x7k83d9v5U/7Lb8bhbEc=";
      };
    };
  });
  meta = {
    description = "";
  };
})
