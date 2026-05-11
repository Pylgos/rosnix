{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_loss";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_loss";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqwt-qt5-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_loss" = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "ac663aeac9e29b09f6a77a94c9a78bc53a7fc91d";
        hash = "sha256-BL5Vel4mA7PMBnDHEkvKZJQ2sItXkj9++wqoV5U6n3I=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.\n  ";
  };
})
