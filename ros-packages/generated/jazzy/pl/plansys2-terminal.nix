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
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_terminal";
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_terminal";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert rclcpp rclcpp-action rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libreadline" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common lifecycle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_terminal" = substituteSource {
      src = fetchgit {
        name = "plansys2_terminal-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "419b7c5608d7f879199f1d409ba72af6a2fc0530";
        hash = "sha256-ztRbxzOE+F1kQdEAcpmISPeeGpJL5RWb5qflPnxjn58=";
      };
    };
  });
  meta = {
    description = "A terminal tool for monitor and manage the ROS2 Planning System";
  };
})
