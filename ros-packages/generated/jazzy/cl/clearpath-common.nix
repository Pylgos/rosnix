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
  version = "2.9.4-1";
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
        rev = "8ec7a2ce51ec7f1a581e2f8dd62783c21ea9083e";
        hash = "sha256-msuEmSemYvQXJ48eSDsUhrKRQwzwMeL0qjAExyDVN5Y=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
