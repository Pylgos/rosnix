{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_mounts_description";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "42e954ad956f44d7b46a144e1dce9be5521cd845";
        hash = "sha256-kawgGQjXrXUcmtWGpgos+VKoUctsH2rMGYLAf/ekePg=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
