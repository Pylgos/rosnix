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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_graphs";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_graphs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "fuse_graphs" = substituteSource {
        src = fetchgit {
          name = "fuse_graphs-source";
          url = "https://github.com/ros2-gbp/fuse-release.git";
          rev = "d0b61c3be9af005a8bc82a956e46093c53dab16d";
          hash = "sha256-AusfOIWBhrljSrjmV1TdhWQl0a1eq5cjsk1nCwPdOe0=";
        };
      };
    });
  };
  meta = {
    description = "The fuse_graphs package provides some concrete implementations of the fuse_core::Graph interface.";
  };
})
