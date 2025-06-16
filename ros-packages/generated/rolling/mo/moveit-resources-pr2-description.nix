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
  pname = "moveit_resources_pr2_description";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_pr2_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_pr2_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_pr2_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "d7b090cddd4315f2c34c830df4a5eb5ebedffb39";
        hash = "sha256-ARyDD66JGqzV4BuXTkV4/fw9uDXzp/iLfuhWZBVPmIo=";
      };
    };
  });
  meta = {
    description = "PR2 Resources used for MoveIt! testing";
  };
})
