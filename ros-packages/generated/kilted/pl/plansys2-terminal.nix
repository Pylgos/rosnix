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
  plansys2-domain-expert,
  plansys2-executor,
  plansys2-msgs,
  plansys2-pddl-parser,
  plansys2-planner,
  plansys2-problem-expert,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_terminal";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."plansys2_terminal";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libreadline" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-domain-expert plansys2-executor plansys2-msgs plansys2-pddl-parser plansys2-planner plansys2-problem-expert rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libreadline" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_terminal" = substituteSource {
      src = fetchgit {
        name = "plansys2_terminal-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "262cadfebbba1002c2bd1b44b165c7412f41ab67";
        hash = "sha256-hDTTOMVIZ6ZtrDh/170yZoIaIOS0yIaRyWt9gWvW3DI=";
      };
    };
  });
  meta = {
    description = "A terminal tool for monitor and manage the ROS2 Planning System";
  };
})
