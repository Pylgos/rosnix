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
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz ];
  passthru.sources = mkSourceSet (sources: {
    "fuse" = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "05cbdd8a802fcc0b8ea22146e1f84e2b406c9f4c";
        hash = "sha256-9MTddfNSVypphI/df/dMqDvmTfuL6FuIHHYQWp6ro1Y=";
      };
    };
  });
  meta = {
    description = "\n    The fuse metapackage.\n  ";
  };
})
