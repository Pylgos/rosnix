{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  inverse-dynamics-solver,
  kdl-parser,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  substituteSource,
  ur-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_inverse_dynamics_solver";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."kdl_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib rclcpp ur-description ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib rclcpp ur-description ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liborocos-kdl" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "kdl_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "41cfa6a6cb2aebf427ed64fc81add3d31a5c5879";
        hash = "sha256-ZooeyOJSy6s9q8q9a/KvyHRg4qiD+WmYXix/SjYVBQg=";
      };
    };
  });
  meta = {
    description = "A KDL-based library implementing an inverse dynamics solver for simulated robots.";
  };
})
