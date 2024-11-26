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
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources_panda_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_panda_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "7bfc2734fd09c71ca53b88b0b17d944375e06f51";
        hash = "sha256-50HSyW1h2ttqppwymHM5VIpHYEHUYQ03FbKAAnIfdGs=";
      };
    };
  });
  meta = {
    description = "panda Resources used for MoveIt testing";
  };
})
