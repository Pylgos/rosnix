{
  ament-cmake,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_common";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "79de717031f6417de45df194598c5f8ec3ed8d55";
        hash = "sha256-DK0mAPSOFPOCpFhqC+6cNOKLdN/ZUvMEZRMxahFzQ3w=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
