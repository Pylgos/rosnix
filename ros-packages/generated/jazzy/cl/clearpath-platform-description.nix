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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_platform_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_platform_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "045c4e7de8af424bb9bc03d9b2c29e117a2cac53";
        hash = "sha256-ygXBvUsTArbRDDvSQC9bSe+6xXOmta4DFCFmLNINWRs=";
      };
    };
  });
  meta = {
    description = "Clearpath Platform URDF descriptions";
  };
})
