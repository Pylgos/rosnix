{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_support";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "62e7030c2afa2a2bdb16de65a3085ba6e307bb81";
        hash = "sha256-4ReKr3jf80G6TNvMKPfhmxjrb8gizGkIZTvMVC+1WjQ=";
      };
    };
  });
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
})
