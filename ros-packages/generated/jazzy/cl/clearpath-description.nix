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
  version = "2.6.4-1";
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
        rev = "90fe85979421257b899743b10be88cde0a72e2f9";
        hash = "sha256-tHynZHyPDDr5rsw4hQDKvWgZVWJGAgj0SkEhQ7swQjU=";
      };
    };
  });
  meta = {
    description = "Clearpath URDF descriptions metapackage";
  };
})
