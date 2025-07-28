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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "4445b4bdb332415b832b58b37093c860fe721d04";
        hash = "sha256-Oe5ErzWuIB62U5frkD267DQPDPkAAFrHl/evgjcVSjU=";
      };
    };
  });
  meta = {
    description = " Mechanical, kinematic and visual description\n  of the Pilz light weight arm PRBT. ";
  };
})
