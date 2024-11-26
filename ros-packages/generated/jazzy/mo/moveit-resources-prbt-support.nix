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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources_prbt_support" = substituteSource {
        src = fetchgit {
          name = "moveit_resources_prbt_support-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "6e0d73e81e61b35524cb3fd7348318881affb6ff";
          hash = "sha256-lAWIBlYGwRc0l2Zzos29VCzMyDmR5ajjrM1Jj05ToJM=";
        };
      };
    });
  };
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
})
