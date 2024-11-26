{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-constraints,
  fuse-core,
  fuse-msgs,
  fuse-variables,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  substituteSource,
  tf2-geometry-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_viz";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_viz" = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "4bdb61089c768561c2fb473dc4ff5329e28f361a";
        hash = "sha256-NCvHYjhFkpD1j5uHnALoy/gv7GrS4HxmJznMhVw5tvc=";
      };
    };
  });
  meta = {
    description = "The fuse_viz package provides visualization tools for fuse.";
  };
})
