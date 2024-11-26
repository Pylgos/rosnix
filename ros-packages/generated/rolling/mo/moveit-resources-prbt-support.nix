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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_support";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ xacro ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources_prbt_support" = substituteSource {
        src = fetchgit {
          name = "moveit_resources_prbt_support-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "4c5940fc78925590b1a0553b326cf3752f87bf05";
          hash = "sha256-l87aYdIm16svC+suFDhJflcsGdzK1xcnn4Ra+k2nUzI=";
        };
      };
    });
  };
  meta = {
    description = "Mechanical, kinematic and visual description of the Pilz light weight arm PRBT.";
  };
})
