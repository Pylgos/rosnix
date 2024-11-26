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
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_panda_moveit_config";
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources_panda_moveit_config";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui moveit-resources-panda-description robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_moveit_config" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "f048126f19cacecb1f7c092287c00c0b39bb162e";
        hash = "sha256-G2SAJQ8QFn7N5xCMdzG4MnXGoK2oaVA4NcrLUShEM7A=";
      };
    };
  });
  meta = {
    description = "";
  };
})
