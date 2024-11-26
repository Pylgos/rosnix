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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_graphs";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_graphs" = substituteSource {
      src = fetchgit {
        name = "fuse_graphs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "f25e0c77ca4aed1f08bed1053c0f08ba9eb03867";
        hash = "sha256-32nxS7uulXMvmTuvb4Bhy+Z86eKI/ze4+kck7ecZi9c=";
      };
    };
  });
  meta = {
    description = "The fuse_graphs package provides some concrete implementations of the fuse_core::Graph interface.";
  };
})
