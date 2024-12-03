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
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "f9a9be53ff7e3ef63bde91489c4f9067ea8e6abf";
        hash = "sha256-CdCiMwj7oumh+ra6npnh9FQbic4f0PaTZ6h+uktnDXc=";
      };
    };
  });
  meta = {
    description = "panda Resources used for MoveIt testing";
  };
})
