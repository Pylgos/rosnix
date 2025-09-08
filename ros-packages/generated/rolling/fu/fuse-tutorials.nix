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
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."fuse_tutorials";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables gtest-vendor nav-msgs rclcpp rviz2 sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables gtest-vendor nav-msgs rclcpp rviz2 sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_tutorials" = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "a81f62ad0e24d9d536ec04f9945f50b2e7be20ec";
        hash = "sha256-ENQ6v/vVaEsidZ4AgKydiLELlDIgkpzNKFUpnBRwQOg=";
      };
    };
  });
  meta = {
    description = "\n    Package containing source code for the fuse tutorials.\n  ";
  };
})
