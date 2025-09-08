{
  ament-cmake,
  ament-cmake-gmock,
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
  fuse-publishers,
  fuse-variables,
  geometry-msgs,
  gtest-vendor,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-2d,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_models";
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."fuse_models";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-graphs fuse-msgs fuse-publishers fuse-variables geometry-msgs gtest-vendor nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-2d tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-constraints fuse-core fuse-graphs fuse-msgs fuse-publishers fuse-variables geometry-msgs gtest-vendor nav-msgs pluginlib rclcpp rclcpp-components sensor-msgs std-srvs tf2 tf2-2d tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_models" = substituteSource {
      src = fetchgit {
        name = "fuse_models-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d4fcbff4648138ad5b30d55972bf6bc1cca346bf";
        hash = "sha256-D1T4ds5rhzhTMwjQVxCT/S3rDxINcvEpi407SU4zFVw=";
      };
    };
  });
  meta = {
    description = "fuse plugins that implement various kinematic and sensor models";
  };
})
