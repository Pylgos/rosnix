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
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_viz";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_viz" = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "9e8c8908d3d2f003da9dfa3cdead7e6d0414a75e";
        hash = "sha256-CcHB+M09GUFY9o6vOjS+UyUTrRaxz0/pWrAZLEZMWBY=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_viz package provides visualization tools for fuse.\n  ";
  };
})
