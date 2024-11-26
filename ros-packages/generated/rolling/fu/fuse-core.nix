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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-msgs pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs launch launch-pytest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_core" = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d3181024c8be26a36664947dcc39d99b5af61a6e";
        hash = "sha256-dm3DZhI8qWZUlH7XQKoCAmrPaZOKrmx8+lf6vaUpzzs=";
      };
    };
  });
  meta = {
    description = "The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these interfaces are provided in other packages.";
  };
})
