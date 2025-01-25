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
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "118681b46c0d430a9b4a991091a0e3fbffb53269";
        hash = "sha256-Ny7lsijtVxyeVg1zbNQcRvv5Fs9VYGqgMqOrBfaCT2k=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
