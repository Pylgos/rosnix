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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "05740774ac4595872ff6606c99adea182b60f512";
        hash = "sha256-4SQhbXpLtJ5oNon+N3FTJye7ysMCgqTodG6Jq1m+tbE=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
