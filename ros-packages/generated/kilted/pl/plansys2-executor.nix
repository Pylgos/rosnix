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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_executor";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_executor";
  nativeBuildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ ament-index-cpp behaviortree-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert pluginlib popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake eigen3-cmake-module ];
  propagatedBuildInputs = [ ament-index-cpp behaviortree-cpp lifecycle-msgs plansys2-core plansys2-domain-expert plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert pluginlib popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_executor" = substituteSource {
      src = fetchgit {
        name = "plansys2_executor-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "5c4fbe14c6f6d7d454af018338b7d98be5b0be64";
        hash = "sha256-PkMHtx4MzbtCO/uk+rY40ixeNLKeMwUfteQnnAsoUPw=";
      };
    };
  });
  meta = {
    description = "This package contains the Executor module for the ROS2 Planning System";
  };
})
