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
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "5d90c07a84b41fc90f5687b6afc6698ab1a415e2";
        hash = "sha256-xfo6X1CxJoAHzsuFCg8v2aBzczGb3+P/MOa8te3xrFc=";
      };
    };
  });
  meta = {
    description = "Fanuc Resources used for MoveIt testing";
  };
})
