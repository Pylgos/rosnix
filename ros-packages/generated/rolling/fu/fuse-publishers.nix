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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_publishers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core fuse-msgs fuse-variables geometry-msgs nav-msgs pluginlib rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common fuse-constraints fuse-graphs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_publishers" = substituteSource {
      src = fetchgit {
        name = "fuse_publishers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "8a90a768d315b7d3d002994c4cb9f4edc34ab147";
        hash = "sha256-XCcEiaJD6vYXpgKsLFonssmY6QczSnBMUhpLzG4o0eA=";
      };
    };
  });
  meta = {
    description = "The fuse_publishers package provides a set of common publisher plugins.";
  };
})
