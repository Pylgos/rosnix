{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-constraints,
  fuse-core,
  fuse-graphs,
  fuse-msgs,
  fuse-variables,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_publishers";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_publishers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ fuse-core fuse-msgs fuse-variables geometry-msgs nav-msgs pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core fuse-msgs fuse-variables geometry-msgs nav-msgs pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common fuse-constraints fuse-graphs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_publishers" = substituteSource {
      src = fetchgit {
        name = "fuse_publishers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "ace4bae137e0fc3a974359ce0e0e5392dde883a3";
        hash = "sha256-AE3WS8AElUC4eWsPhBqIC9e7a7hGgwjickv8BMLygKI=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_publishers package provides a set of common publisher plugins.\n  ";
  };
})
