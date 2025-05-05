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
  pname = "moveit_resources_panda_description";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_panda_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "9574b92d1f9dde32a38f52178cb9bc956ed8ac65";
        hash = "sha256-CdCiMwj7oumh+ra6npnh9FQbic4f0PaTZ6h+uktnDXc=";
      };
    };
  });
  meta = {
    description = "panda Resources used for MoveIt testing";
  };
})
