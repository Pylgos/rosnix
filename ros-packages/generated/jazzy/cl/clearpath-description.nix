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
  version = "2.8.5-1";
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
        rev = "443bb35cbc7a723a44fc7ac18c50ec4be238e95f";
        hash = "sha256-vrRSxlhL0yKlHtwq1+IaPpKTDhJL3qvL3HOBJIv3xPo=";
      };
    };
  });
  meta = {
    description = "Clearpath URDF descriptions metapackage";
  };
})
