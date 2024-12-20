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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b5ab8929a34fdf4f9427f9b6e6fda2ec81617173";
        hash = "sha256-L8bbQU8OVSWNHz3e4zZAMV6XKeJ3uPI6FDtYyCDkJIc=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
