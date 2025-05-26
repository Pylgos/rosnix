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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse";
  version = "1.2.3-1";
  src = finalAttrs.passthru.sources."fuse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz gtest-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "767f61ab54c73e641c537fd1bd63ca2453637263";
        hash = "sha256-ZQ91XAEQeQIiOjwEJnISOH0I8qkryi651Uh5YaUWEek=";
      };
    };
  });
  meta = {
    description = "\n    The fuse metapackage.\n  ";
  };
})
