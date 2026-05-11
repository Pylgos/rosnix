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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_viz";
  version = "1.2.6-1";
  src = finalAttrs.passthru.sources."fuse_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_viz" = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "2ca534a3f655aed9fb547f90230cbeb8264be7b3";
        hash = "sha256-W+qoPs3T8Gb0Nvmh5vYNSa+kOsNL8Q+Nvy0D6xA8Mb0=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_viz package provides visualization tools for fuse.\n  ";
  };
})
