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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "d96564c168b96b1aef682e56577be2ca0987bfb2";
        hash = "sha256-xfo6X1CxJoAHzsuFCg8v2aBzczGb3+P/MOa8te3xrFc=";
      };
    };
  });
  meta = {
    description = "Fanuc Resources used for MoveIt testing";
  };
})
