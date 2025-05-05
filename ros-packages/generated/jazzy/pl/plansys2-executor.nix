{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-core,
  plansys2-domain-expert,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  pluginlib,
  popf,
  rclcpp,
  rclcpp-action,
  rclcpp-cascade-lifecycle,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_executor";
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_executor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ behaviortree-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert pluginlib popf rclcpp-action rclcpp-cascade-lifecycle std-msgs std-srvs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_executor" = substituteSource {
      src = fetchgit {
        name = "plansys2_executor-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "80a2079568e81103477f0764d17715f6b129055e";
        hash = "sha256-TJAcaCiFjdZ8hgwRVgBvnvPcpSBV5pKsWEEJSW5XYGo=";
      };
    };
  });
  meta = {
    description = "This package contains the Executor module for the ROS2 Planning System";
  };
})
