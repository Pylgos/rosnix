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
        rev = "29ac43a17b02062e0984820acfbd3bdc0f6c8025";
        hash = "sha256-DK0mAPSOFPOCpFhqC+6cNOKLdN/ZUvMEZRMxahFzQ3w=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
