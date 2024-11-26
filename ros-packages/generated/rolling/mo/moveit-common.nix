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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_common" = substituteSource {
        src = fetchgit {
          name = "moveit_common-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "b1ffb678975e6d1b97c6dea75f3cd26a26b1592e";
          hash = "sha256-oyXDCWuV4YleDbzgpjYXM1LBn0NDcY5qERtXckiITqM=";
        };
      };
    });
  };
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
