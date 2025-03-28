{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-constraints,
  fuse-core,
  fuse-graphs,
  fuse-models,
  fuse-msgs,
  fuse-variables,
  geometry-msgs,
  launch,
  launch-pytest,
  launch-ros,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_optimizers";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_optimizers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-updater fuse-constraints fuse-core fuse-graphs fuse-msgs fuse-variables pluginlib rclcpp rclcpp-components std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common fuse-models geometry-msgs launch launch-pytest launch-ros nav-msgs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_optimizers" = substituteSource {
      src = fetchgit {
        name = "fuse_optimizers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "ef854833a4ef2cec6e1c7135fc872a3ecf0756fb";
        hash = "sha256-h/7yPDqWfid98jxASI7wOfQhg8dx8Z3e8RKHU0fshao=";
      };
    };
  });
  meta = {
    description = "The fuse_optimizers package provides a set of optimizer implementations. An optimizer is the object responsible \\ for coordinating the sensors and motion model inputs, computing the optimal state values, and providing access to \\ to the optimal state via the publishers.";
  };
})
