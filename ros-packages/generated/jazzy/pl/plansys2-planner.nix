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
  lifecycle-msgs,
  mkSourceSet,
  plansys2-core,
  plansys2-domain-expert,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-popf-plan-solver,
  plansys2-problem-expert,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  ros2run,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_planner";
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver plansys2-problem-expert pluginlib rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_planner" = substituteSource {
      src = fetchgit {
        name = "plansys2_planner-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "f3828eb3377b65c568a2332256bd8d26a1a70d40";
        hash = "sha256-VccuoLC/yAJ3A2SKqM2uRSH3/TriW0bS4jk8me2+z/U=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
