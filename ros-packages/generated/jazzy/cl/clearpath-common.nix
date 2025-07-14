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
  version = "2.6.1-1";
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
        rev = "f3ba8025410e0fdad474d040f8db4576c457c64e";
        hash = "sha256-b2PcPs6HKrjWI8Q7GOKhsdzcOXfwQRwverR21xDjoz0=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
