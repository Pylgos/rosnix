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
  version = "2.7.4-1";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "f0f79d53343a73aef1d35fa40d7f6e97eb2bc4b3";
        hash = "sha256-DyUlzvDmyPJW0Y7Sad8Z4YtrDj4BnLNmwqSA6T2p3w8=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
