{
  ament-cmake,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_doc";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "5e33c44e680e60eb7045e297cbde89b4b7c61fcc";
        hash = "sha256-13HPmoYeKcr27hJYyUKsNQvivjF6PRv+QcLifmfbQdk=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_doc package provides documentation and examples for the fuse package.\n  ";
  };
})
