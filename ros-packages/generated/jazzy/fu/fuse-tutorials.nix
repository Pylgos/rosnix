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
  fuse-models,
  fuse-optimizers,
  fuse-publishers,
  fuse-variables,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_tutorials";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_tutorials";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables nav-msgs rclcpp rviz2 sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "fuse_tutorials" = substituteSource {
        src = fetchgit {
          name = "fuse_tutorials-source";
          url = "https://github.com/ros2-gbp/fuse-release.git";
          rev = "f232a1b1da77324067d9d5fa4433af543fd2f9bc";
          hash = "sha256-jix3x/BhHI2P7id3wpsr2TRpqn3Mp/Q+ppU0oZwwSBU=";
        };
      };
    });
  };
  meta = {
    description = "Package containing source code for the fuse tutorials.";
  };
})
