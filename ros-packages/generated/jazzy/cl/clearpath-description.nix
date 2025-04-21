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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."clearpath_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-manipulators-description clearpath-mounts-description clearpath-platform-description clearpath-sensors-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "ca93134f90fb4ce690d4c0b16d37ca4369dd64ea";
        hash = "sha256-HrMfNXhHuGUJ7eCHPHjjvQFJCt5qpwEExcsMm53h6gM=";
      };
    };
  });
  meta = {
    description = "Clearpath URDF descriptions metapackage";
  };
})
