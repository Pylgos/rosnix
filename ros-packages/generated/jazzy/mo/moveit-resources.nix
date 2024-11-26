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
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ joint-state-publisher moveit-resources-fanuc-description moveit-resources-fanuc-moveit-config moveit-resources-panda-description moveit-resources-panda-moveit-config moveit-resources-pr2-description robot-state-publisher ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources" = substituteSource {
        src = fetchgit {
          name = "moveit_resources-source";
          url = "https://github.com/ros2-gbp/moveit_resources-release.git";
          rev = "ae769c36e1183d208fb2aea7d5135c440427c26d";
          hash = "sha256-nQVTLNFKshftxcEkkLVLw+Azj/KgNptezxk3p/3foWw=";
        };
      };
    });
  };
  meta = {
    description = "Resources used for MoveIt testing";
  };
})
