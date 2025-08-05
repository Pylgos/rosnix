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
  fuse-constraints,
  fuse-core,
  fuse-graphs,
  fuse-msgs,
  fuse-variables,
  geometry-msgs,
  gtest-vendor,
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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."fuse_publishers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor nav-msgs pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-core fuse-msgs fuse-variables geometry-msgs gtest-vendor nav-msgs pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common fuse-constraints fuse-graphs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_publishers" = substituteSource {
      src = fetchgit {
        name = "fuse_publishers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "24d7ea83892d0d51ecdf9b74a80ec47095e2766d";
        hash = "sha256-rLrCxcVGIIpwytyz+ljnB6vmeYMI+qseJr4XPuuNIV0=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_publishers package provides a set of common publisher plugins.\n  ";
  };
})
