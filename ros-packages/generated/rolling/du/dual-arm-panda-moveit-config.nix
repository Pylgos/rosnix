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
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dual_arm_panda_moveit_config";
  version = "3.1.1-2";
  src = finalAttrs.passthru.sources."dual_arm_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher topic-tools xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher topic-tools xacro ];
  passthru.sources = mkSourceSet (sources: {
    "dual_arm_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "dual_arm_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "e6f553ddec4912850e778598c810de4d88ecff9d";
        hash = "sha256-ji9r5OU56EAnyiYL5ISvP51d5wWi2hhyjk6Bw8Y2DH8=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
