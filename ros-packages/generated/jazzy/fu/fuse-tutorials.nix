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
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_tutorials";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables nav-msgs rclcpp rviz2 sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables nav-msgs rclcpp rviz2 sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_tutorials" = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "7863e1743685c55ae5e4550abe714ac69d2674ac";
        hash = "sha256-GzBYoEU9ukaFKKpWRbIkILh/dIk4fpAWBSE6sbCDjnQ=";
      };
    };
  });
  meta = {
    description = "\n    Package containing source code for the fuse tutorials.\n  ";
  };
})
