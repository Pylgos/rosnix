{
  ament-cmake-gtest,
  ament-cmake-pytest,
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
  pname = "fuse_variables";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_variables";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "fuse_variables" = substituteSource {
        src = fetchgit {
          name = "fuse_variables-source";
          url = "https://github.com/ros2-gbp/fuse-release.git";
          rev = "145adf8242958fb6fcd560f0dd2290831f56b5c3";
          hash = "sha256-AMhieBzcBZ3yM1FzMq5T4FSo0yIRC4CmcOU3jOloF0Q=";
        };
      };
    });
  };
  meta = {
    description = "The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\ orientations, velocities, and accelerations.";
  };
})
