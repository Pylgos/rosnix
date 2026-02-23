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
  rmw-cyclonedds-cpp,
  rmw-fastrtps-cpp,
  rmw-zenoh-cpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_common";
  version = "2.9.1-1";
  src = finalAttrs.passthru.sources."clearpath_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-control clearpath-description clearpath-generator-common rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-zenoh-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-control clearpath-description clearpath-generator-common rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-zenoh-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_common" = substituteSource {
      src = fetchgit {
        name = "clearpath_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "86218f2f169e3e5a3c4c9ca72372b8f4f4755b40";
        hash = "sha256-JSN/mXqeBsU0xMf76rnAjKf45kqJ94pVH9m6vIsFKTc=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
