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
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."fuse_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-msgs fuse-variables geometry-msgs rviz-common rviz-rendering tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_viz" = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "14dce5959e456f65b05340f3a14e58730048336b";
        hash = "sha256-v7aepVgoFBRoxo5HX+9PNzk2Y2j0Mgvsb8JjV9f73gY=";
      };
    };
  });
  meta = {
    description = "The fuse_viz package provides visualization tools for fuse.";
  };
})
