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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "c9edd2dde9152a0becb6b3fec89121d26e0a41d5";
        hash = "sha256-CsaFS6o+pS/EcwQfmXHvz3RxxA/FINopNnWQCxD0Nj4=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
