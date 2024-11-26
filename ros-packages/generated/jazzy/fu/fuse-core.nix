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
  fuse-msgs,
  geometry-msgs,
  launch,
  launch-pytest,
  mkSourceSet,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_core";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-msgs pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs launch launch-pytest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_core" = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "b3b1cb3f75ff1d3fa4e45646dbdbf24f5497857b";
        hash = "sha256-Ge1xbnN6OG5f2HhwAR/cxfzZv6PBB4W7N18Zhhi0RL0=";
      };
    };
  });
  meta = {
    description = "The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these interfaces are provided in other packages.";
  };
})
