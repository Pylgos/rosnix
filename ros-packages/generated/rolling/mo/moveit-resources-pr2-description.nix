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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_pr2_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_pr2_description" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_pr2_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "f463fd1b06f3e4d4ab62fed2e4c7050f831ebd76";
        hash = "sha256-AW034G96OGUrsidY8AslalNqexJ+F0B25tniGWq6G5w=";
      };
    };
  });
  meta = {
    description = "PR2 Resources used for MoveIt! testing";
  };
})
