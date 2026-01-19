{
  ament-cmake,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-constraints,
  fuse-core,
  fuse-doc,
  fuse-graphs,
  fuse-models,
  fuse-msgs,
  fuse-optimizers,
  fuse-publishers,
  fuse-variables,
  fuse-viz,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."fuse";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz gtest-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "1c06532f3e472816cae7e561aa56c60afc2e283f";
        hash = "sha256-Cur7T/W4hYZZgqop8Y+NSsWK7+PhrvhrYRDBkIuA6e0=";
      };
    };
  });
  meta = {
    description = "\n    The fuse metapackage.\n  ";
  };
})
