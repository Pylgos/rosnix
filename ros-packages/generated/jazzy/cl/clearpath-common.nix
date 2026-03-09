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
  version = "2.9.3-1";
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
        rev = "7441edb4e2e61eec6eeef6f70d1535132cbe41d0";
        hash = "sha256-AXNNALopEZVHCD3V1pUDKlo307Jp1FGdFPLizMxoo7I=";
      };
    };
  });
  meta = {
    description = "Clearpath Common Metapackage";
  };
})
