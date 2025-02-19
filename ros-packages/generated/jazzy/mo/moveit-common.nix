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
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "09f6d0f9596d0d4c5cb4b8cab50f57fa42df57d2";
        hash = "sha256-ri0zn9WJrg2joE1B5eFN6/C59588o7pfLXRrkcvW2Vo=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
