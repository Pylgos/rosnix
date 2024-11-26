{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_fanuc_description";
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "d468edc461adbbc22d4f3fcf715695f491927ce9";
        hash = "sha256-x/iys4VikU/BQxbNSLBFX67NjJOLF/0SG8WHjCrEovs=";
      };
    };
  });
  meta = {
    description = "Fanuc Resources used for MoveIt testing";
  };
})
