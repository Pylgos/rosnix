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
  fuse-graphs,
  fuse-variables,
  geometry-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_constraints";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_constraints";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core fuse-graphs fuse-variables geometry-msgs pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "suitesparse" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fuse_constraints" = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "1200006240989303f086811f226ab7a841a124d6";
        hash = "sha256-c62NE6NrO6Amg2XxYP/AdRC42P1WIxHe7O6ypp7gOvE=";
      };
    };
  });
  meta = {
    description = "The fuse_constraints package provides a set of commonly used constraint types, such as direct measurements on \\ state variables (absolute constraints) or measurements of the state changes (relative constraints).";
  };
})
