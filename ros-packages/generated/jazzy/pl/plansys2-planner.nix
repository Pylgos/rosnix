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
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_planner";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-popf-plan-solver plansys2-problem-expert pluginlib rclcpp rclcpp-action rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_planner" = substituteSource {
      src = fetchgit {
        name = "plansys2_planner-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "d1514796dfd085bc09dc1fd5312ed9ea214e941c";
        hash = "sha256-9SZj2g0ex6+FurJRLXQHP8yw70yVxCSxyLShoy+9nbQ=";
      };
    };
  });
  meta = {
    description = "This package contains the PDDL-based Planner module for the ROS2 Planning System";
  };
})
