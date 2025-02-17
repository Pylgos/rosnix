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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e75b55d938eca3af9dd4b159b635d1fc4d05ef15";
        hash = "sha256-3s4qGcTFEi+V0IewCFQ6e3XXsmRYOWA4Q4zC7byN6/w=";
      };
    };
  });
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
})
