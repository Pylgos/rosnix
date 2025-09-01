{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-manipulators-description,
  clearpath-mounts-description,
  clearpath-platform-description,
  clearpath-sensors-description,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_description";
  version = "2.7.0-1";
  src = finalAttrs.passthru.sources."clearpath_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-manipulators-description clearpath-mounts-description clearpath-platform-description clearpath-sensors-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-manipulators-description clearpath-mounts-description clearpath-platform-description clearpath-sensors-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "f6659ee5785aad9569b5c87666aae7970a7750c2";
        hash = "sha256-uY4bW1B/n2gds/3CcUouajRTUaMu2kroS7zISzBB/CU=";
      };
    };
  });
  meta = {
    description = "Clearpath URDF descriptions metapackage";
  };
})
