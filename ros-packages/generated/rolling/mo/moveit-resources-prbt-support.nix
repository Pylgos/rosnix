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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "c6490ecb925d60835c0fe0db61d26728ed40d657";
        hash = "sha256-fVxjIDpW1KOHhCdfHRGfPWXqu30SBU4NlJhkL5T212o=";
      };
    };
  });
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
})
