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
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."moveit_resources_pr2_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources_pr2_description" = substituteSource {
        src = fetchgit {
          name = "moveit_resources_pr2_description-source";
          url = "https://github.com/ros2-gbp/moveit_resources-release.git";
          rev = "821741ae9a650e7a880e86656b85a7366a9f6ccc";
          hash = "sha256-9yVWeyYXh1lWUcisKLickZOAQgmOAKkwvWNQ+99mCKQ=";
        };
      };
    });
  };
  meta = {
    description = "PR2 Resources used for MoveIt! testing";
  };
})
