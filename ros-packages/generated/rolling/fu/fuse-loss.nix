{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-core,
  gtest-vendor,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_loss";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."fuse_loss";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqwt-qt5-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_loss" = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "705d334d54a01dcb1081e8197d7c6f8916a1e736";
        hash = "sha256-dL3L4jNBLecGhcBruworjn2Hcm5F2pxmJ6VYx/k79Kk=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.\n  ";
  };
})
