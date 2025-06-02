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
  version = "2.5.0-1";
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
        rev = "1c1a51453988c8a7bb8c6c355a77e92eaef44934";
        hash = "sha256-BbYpeIhR6cWHRebuPnUPoLVjIN1XbZZJjZSoNjoI8hE=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
