{
  ament-cmake,
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
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  rviz-common,
  rviz-rendering,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_viz";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."fuse_viz";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_viz" = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "8269f9c56322f8e09946eab88c8448a6af3763bb";
        hash = "sha256-zd+YenWeeu3oReVPLlsr7QZW8tF+Z/4qgVjD0bXL0I0=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_viz package provides visualization tools for fuse.\n  ";
  };
})
