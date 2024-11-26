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
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz ];
  passthru.sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "146b505aa3208d25a2e7c1b5d170efc44094bc45";
        hash = "sha256-L7mooOifcCJDLiXwk0are7MS7SnxR8s1MrIPCwexfD4=";
      };
    };
  });
  meta = {
    description = "The fuse metapackage.";
  };
})
