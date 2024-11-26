{
  ament-cmake,
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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz ];
  passthru.sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d251c6eb221ff1b1b7e9c1189bce2e8d40cbfaba";
        hash = "sha256-tsigICiAe41pYCCetgVQ+FRHXKhctEb9mmfU/tnWBAs=";
      };
    };
  });
  meta = {
    description = "The fuse metapackage.";
  };
})
