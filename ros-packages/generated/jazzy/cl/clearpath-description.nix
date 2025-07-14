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
  version = "2.6.1-1";
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
        rev = "44d2a123c7002ce2ddb80af90f3a43e043aec4c1";
        hash = "sha256-8W3nkDABv/t8YIVxCgu8/vRnp6tKEyp+FDudYRiRAkM=";
      };
    };
  });
  meta = {
    description = "Clearpath URDF descriptions metapackage";
  };
})
