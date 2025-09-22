{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-control,
  clearpath-description,
  clearpath-generator-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_common";
  version = "2.7.4-1";
  src = finalAttrs.passthru.sources."clearpath_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-control clearpath-description clearpath-generator-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-control clearpath-description clearpath-generator-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_common" = substituteSource {
      src = fetchgit {
        name = "clearpath_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "919a8591875602684ec8cd1d1a5eb4930279d1b5";
        hash = "sha256-lnxvVuVpMDsxNcCIIZO3Tg6UqRR84PA4TfPW4U0P8ds=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
