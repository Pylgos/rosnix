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
  version = "1.2.4-1";
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
        rev = "5827519f9e6933494113f916ffc77a981bfd8fb1";
        hash = "sha256-tPoOfNkDLTbP62TR4iDQ5+U1LAG/uDCdMllT1rK5LBY=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_constraints package provides a set of commonly used constraint types, such as direct measurements on \\\n    state variables (absolute constraints) or measurements of the state changes (relative constraints).\n  ";
  };
})
