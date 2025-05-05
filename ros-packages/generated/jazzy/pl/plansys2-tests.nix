{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  popf,
  rclcpp,
  rclcpp-action,
  rclcpp-cascade-lifecycle,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_tests";
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_tests";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp behaviortree-cpp lifecycle-msgs plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp behaviortree-cpp lifecycle-msgs plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert popf rclcpp rclcpp-action rclcpp-cascade-lifecycle rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_tests" = substituteSource {
      src = fetchgit {
        name = "plansys2_tests-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "1fbb2c1f21cbd75e7b943dc7f9eeca7251435254";
        hash = "sha256-5zofw8Met3uGyTrPkr9niTYw6J05maUcd1EJaVASDtU=";
      };
    };
  });
  meta = {
    description = "This package contains the tests package for the ROS2 Planning System";
  };
})
