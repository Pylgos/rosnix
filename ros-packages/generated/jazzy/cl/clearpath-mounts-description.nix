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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "ec71eb76215db1a92e7bcb8e5da90d1980429c26";
        hash = "sha256-UB3jP3AOX4Hv8ycQeZ3NWzuV26ssN7KvU66c73DCbK0=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
