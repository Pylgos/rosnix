{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_platform_description";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."clearpath_platform_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "c02dc57c31132a2aa3c00ba205b61e3ba949a0ce";
        hash = "sha256-4UhiOPRPQ7ei2y/ABr/vzD6IuLm5AIIjubXo4Rfvplg=";
      };
    };
  });
  meta = {
    description = "Clearpath Platform URDF descriptions";
  };
})
