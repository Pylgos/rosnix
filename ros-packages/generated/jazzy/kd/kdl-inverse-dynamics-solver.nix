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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."kdl_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib ur-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver kdl-parser pluginlib ur-description ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "kdl_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "5596c3cf30304f7c637bb0aab258a3c7362c4b23";
        hash = "sha256-naTrLcjm9sxxruCDz7giwbWBr3sggSfHUSf+mWFUzTQ=";
      };
    };
  });
  meta = {
    description = "A KDL-based library implementing an inverse dynamics solver for simulated robots.";
  };
})
