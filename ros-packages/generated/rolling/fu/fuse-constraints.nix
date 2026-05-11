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
  fuse-core,
  fuse-graphs,
  fuse-variables,
  geometry-msgs,
  gtest-vendor,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_constraints";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."fuse_constraints";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-core fuse-graphs fuse-variables geometry-msgs gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libceres-dev" "suitesparse" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-core fuse-graphs fuse-variables geometry-msgs gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "suitesparse" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_constraints" = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "e8f545b224359dfcc87ed03f1289c9ab4549e741";
        hash = "sha256-KgS/xJunUA8UuXWSvK7SIuBUmIcUUA7HCU2KCa2RaaY=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_constraints package provides a set of commonly used constraint types, such as direct measurements on \\\n    state variables (absolute constraints) or measurements of the state changes (relative constraints).\n  ";
  };
})
