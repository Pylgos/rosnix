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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "cc62ba205644602c13677aaf6262836abab79bfd";
        hash = "sha256-p/AE95OHLUVze8ucHPSm2cm6xqk0bk/5dS8g9SwfKQw=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
