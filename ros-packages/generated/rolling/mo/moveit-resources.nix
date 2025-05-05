{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  moveit-resources-fanuc-description,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-description,
  moveit-resources-panda-moveit-config,
  moveit-resources-pr2-description,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."moveit_resources";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-resources-pr2-description robot-state-publisher ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-resources-pr2-description robot-state-publisher ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources" = substituteSource {
      src = fetchgit {
        name = "moveit_resources-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "0c88002b41768277f736f843fd6867b96e85491c";
        hash = "sha256-6J7MTnMgBLAMzilLeVDUL57v4IarOTKXPRjV20LswEQ=";
      };
    };
  });
  meta = {
    description = "Resources used for MoveIt testing";
  };
})
