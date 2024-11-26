{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-core,
  pluginlib,
  popf,
  rclcpp,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_popf_plan_solver";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_popf_plan_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp plansys2-core pluginlib popf rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_popf_plan_solver" = substituteSource {
      src = fetchgit {
        name = "plansys2_popf_plan_solver-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "3c965e1b84f5be911dc69cbe9e4cdc94d71dbc5f";
        hash = "sha256-47cXRuivYJrvJLIUw2qrCc0Qlt2nCZYaGfNHHPCj9+8=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
