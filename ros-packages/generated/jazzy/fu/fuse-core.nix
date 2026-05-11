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
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_core";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ fuse-msgs pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-msgs pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs launch launch-pytest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_core" = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "ef0c97cf3d17e6378f332f7773e33033f7cd1f1d";
        hash = "sha256-iCz9PaweuLhTIDrTb74VJAPkioqj48dqTRiaf1GbxxY=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these\n    interfaces are provided in other packages.\n  ";
  };
})
