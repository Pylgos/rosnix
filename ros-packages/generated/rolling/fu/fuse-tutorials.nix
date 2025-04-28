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
  fuse-models,
  fuse-optimizers,
  fuse-publishers,
  fuse-variables,
  gtest-vendor,
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
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."fuse_tutorials";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables nav-msgs rclcpp rviz2 sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_tutorials" = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "ca7195d9070c367d8b71d40381a9add9b6ac2225";
        hash = "sha256-kXXE9o7bPP++mfcjGo8e84VUR4WzxGkspcXRt5ml67E=";
      };
    };
  });
  meta = {
    description = "Package containing source code for the fuse tutorials.";
  };
})
