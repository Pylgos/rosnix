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
  version = "2.8.2-2";
  src = finalAttrs.passthru.sources."clearpath_mounts_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_mounts_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_mounts_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "e71c4b0e7fb07e0d7ef950d5920a085c4007024e";
        hash = "sha256-cliCihjM+6uQ3xmNhXZEpyfFY+Z7iQayskKYPWmL/Kg=";
      };
    };
  });
  meta = {
    description = "Clearpath mounts URDF descriptions";
  };
})
