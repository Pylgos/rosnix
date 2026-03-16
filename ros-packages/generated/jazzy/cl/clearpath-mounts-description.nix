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
  version = "2.9.4-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "145d8c9c927bc44e5108f9d9b6590df264e3db87";
        hash = "sha256-Ps3+ZocINJODtv/TPOrmjG3hkHkyiwC66fOPkiRKQP4=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
