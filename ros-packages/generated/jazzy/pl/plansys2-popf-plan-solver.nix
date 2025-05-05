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
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_popf_plan_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp plansys2-core pluginlib popf rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp plansys2-core pluginlib popf rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_popf_plan_solver" = substituteSource {
      src = fetchgit {
        name = "plansys2_popf_plan_solver-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "c7e82e6525930d7b88dc876b2a61dee2ba387709";
        hash = "sha256-NXbbAeIqa8ZexWEtn7hZJXezQuuI+vCXkSYaNcFBqSM=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
