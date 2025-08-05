{
  ament-cmake,
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
  gtest-vendor,
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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."fuse_optimizers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros diagnostic-updater fuse-constraints fuse-core fuse-graphs fuse-msgs fuse-variables gtest-vendor pluginlib rclcpp rclcpp-components std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros diagnostic-updater fuse-constraints fuse-core fuse-graphs fuse-msgs fuse-variables gtest-vendor pluginlib rclcpp rclcpp-components std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common fuse-models geometry-msgs launch launch-pytest launch-ros nav-msgs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_optimizers" = substituteSource {
      src = fetchgit {
        name = "fuse_optimizers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "9d9faae93d3262bb908106f014587f5898b5dcbc";
        hash = "sha256-8edCLwxtT08IG6LSFqRwqAo+AR2nLidDRTnqjNCGQnw=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_optimizers package provides a set of optimizer implementations. An optimizer is the object responsible \\\n    for coordinating the sensors and motion model inputs, computing the optimal state values, and providing access to \\\n    to the optimal state via the publishers.\n  ";
  };
})
