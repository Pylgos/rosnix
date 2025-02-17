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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7a11e5ad8a3a782c3486f9b6e461a5780e2952bf";
        hash = "sha256-wc6ZonKneMhQty+CzEjDesHChnAaG8l9KO8lvZ8GVYw=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
