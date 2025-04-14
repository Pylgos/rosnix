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
  pname = "clearpath_mounts_description";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "b0f50ccf1ca159bd42be8daf3400dd1f03792fca";
        hash = "sha256-KmzmR34OhGuOLlpooyQSpezkTzPjXsbmUvCtVFsCXKE=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
