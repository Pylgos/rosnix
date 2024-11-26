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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_loss";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqwt-qt5-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_loss" = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "7b05d6a1ccd5499886f3496e98369afc3681b637";
        hash = "sha256-06MhRmCfOfKljgI2ebmY/Rm9fh0ROvWMgpyPxJD/aKs=";
      };
    };
  });
  meta = {
    description = "The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.";
  };
})
