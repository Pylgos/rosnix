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
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_fanuc_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_fanuc_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "bb4babbb404b502b5ee259ecda51c261888d8758";
        hash = "sha256-Qp7a/43zNcFvVPgW4Zftq5BwXbEGwDjzDl7g3g6krYg=";
      };
    };
  });
  meta = {
    description = "Fanuc Resources used for MoveIt testing";
  };
})
