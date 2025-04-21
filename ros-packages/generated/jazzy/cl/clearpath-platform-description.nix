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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."clearpath_platform_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "6fc5d54d164b56a540b98f9e5087b511adaca622";
        hash = "sha256-R5YSy6/sAkCmNNq3Io3R6Hj6ZMQbMrtbI4r+tMiuZwY=";
      };
    };
  });
  meta = {
    description = "Clearpath Platform URDF descriptions";
  };
})
