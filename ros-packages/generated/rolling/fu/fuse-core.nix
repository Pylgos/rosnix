{
  ament-cmake,
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
  gtest-vendor,
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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."fuse_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-msgs gtest-vendor pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-msgs gtest-vendor pluginlib rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs launch launch-pytest rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_core" = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d0ded6753e97d7e3e431ee654939922ddf9c1166";
        hash = "sha256-lIQeiBKgLv+L3poKrZFTUPXwc+KKnw1S4arQ09lrCXQ=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these\n    interfaces are provided in other packages.\n  ";
  };
})
